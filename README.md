# Smash Stack Project

The Smash Stack project demonstrates the integration of Firebase Firestore with both a Flutter mobile app and a Node.js script for importing data. The project involves creating Firestore collections and documents, importing data into Firestore using a Node.js script, and displaying the data in a Flutter app.

<img src="./public/smash_app_demo.gif" alt="Smash App Demo" width="400"/>

## Smash Stack Components

1. **Firebase Firestore:**
   - Create a new Firebase project.
   - Design and organize data from `data/world-cities.csv` into Firestore collections and documents.

2. **Node.js Importer:**
   - Connect with Firebase Admin SDK.
   - Create a `credential.json` file with Firebase project keys.
   - Install dependencies using `npm install`.
   - Run the migration script using `npm run migrate` to import data into Firestore.

3. **Flutter App:**
   - Create a new Flutter project.
   - Follow UX Diagrams to design screens.
   - Configure Firestore collections.
   - Display data and implement navigation between screens.

## Usage

1. Start by setting up Firestore and running the Node.js script to populate data.

2. Run the Flutter app to visualize the imported data.
