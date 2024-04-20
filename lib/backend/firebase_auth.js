// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyB2ye5vscFm1eiOiPVBIQ8np-CnGNk4DQc",
  authDomain: "student-housing-db.firebaseapp.com",
  projectId: "student-housing-db",
  storageBucket: "student-housing-db.appspot.com",
  messagingSenderId: "997141921548",
  appId: "1:997141921548:web:bf2eddec6a5f78a1e8d329",
  measurementId: "G-Z7JRQ04TGX"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);