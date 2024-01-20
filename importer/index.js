const admin = require('firebase-admin')
const { pipeline } = require("node:stream/promises")
const { createReadStream } = require("node:fs")
const csvParse = require("csv-parser")

const credentials = require('./credentials.json')
const BatchTransform = require("./BatchTransform.js")
const DataItemSchema = require("./schema.js")

const initFirestore = () => {
    const app = admin.initializeApp({
        credential: admin.credential.cert(credentials)
    })

    return app.firestore()
}

const importData = async () => {
    const db = initFirestore()

    const chunkLengthToBeUploadByTime = 400
    const linesWithError = []

    const bulkTransform = new BatchTransform({
        batchLength: chunkLengthToBeUploadByTime,
        formatDataFn: (item) => {
            const result = DataItemSchema.parse(item)
            return result
        },
        saveErrorsFn: (line) => {
            linesWithError.push(line)
        },
        opts: { objectMode: true },
    })

    const filePath = './world-cities.csv'
    let totalSavedItems = 0
    const resolves = []
    await pipeline(
        createReadStream(filePath),
        csvParse(),
        bulkTransform,
        async function* (data) {
            for await (const batch of data) {
                resolves.push(new Promise(async (resolve) => {
                    try {
                        await firestoreBatch(db, batch)
                        totalSavedItems += batch.size
                    } catch (e) {
                        console.error(e)
                        linesWithError.push(...batch.keys())
                    } finally {
                        resolve()
                    }
                }))
            }
        },
    )

    const results = await Promise.all(resolves)
        .catch(e => {
            console.error(e)
        })

    console.log(results)
    if (totalSavedItems > 0) {
        console.log('Total de items salvos:', totalSavedItems)
    }

    if (linesWithError.length > 0) {
        console.log('Ocorreu algum erro ao tentar adicionar as seguintes linhas:', linesWithError)
    }
}

const countryIds = new Set()

const firestoreBatch = async (db, items) => {
    const batch = db.batch()

    for (const lineItem of items.keys()) {
        const item = items.get(lineItem)

        const collectionName = 'locations'
        const citiesCollectionName = 'cities'

        const id = btoa(item.country)
        const countryCollectionRef = db.collection(collectionName).doc(id)
        if (!countryIds.has(id)) {
            countryIds.add(id)
            batch.set(countryCollectionRef, {
                name: item.country,
            })
        }


        const cityDocRef = countryCollectionRef.collection(citiesCollectionName).doc(item.geonameid)

        batch.set(cityDocRef, {
            name: item.name,
            subcountry: item.subcountry,
            geonameid: item.geonameid,
        })
    }

    await batch.commit()
}

importData()