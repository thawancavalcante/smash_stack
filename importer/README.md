# Importer Node.js Script

This Node.js script is part of the Smash Stack project, responsible for importing data into Firestore. 
The script uses the Firebase Admin SDK to connect with Firestore and manipulate data.

## Getting Started

1. Create a new Firebase project [https://firebase.google.com/].

2. Create a file named `credential.json` with your Firebase project keys:
   - Go to Project Settings -> Service Account -> Generate a private key.

3. Install dependencies:
   ```
   npm install
   ```

4. Run the migration script to import/create data from `world-cities.csv` into Firestore collections:
   ```
   npm run migrate
   ```

Ensure that the Firestore collections are populated with the data from the CSV file.