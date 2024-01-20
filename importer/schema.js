const { z } = require("zod")

module.exports = DataItemSchema = z.object({
    name: z.string(),
    country: z.string(),
    subcountry: z.string(),
    geonameid: z.string(),
})