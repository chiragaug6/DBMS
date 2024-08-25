//use yourDatabaseName;  // Switch to your database (create one if it doesn't exist)

// Insert the documents into the STUDENT collection
db.STUDENT.insertMany([
  {
    ROLLNO: 101,
    SNAME: "Vina",
    DEPARTMENT: "CE",
    FEES: 15000,
    SEM: 3,
    GENDER: "Female",
    CITY: "Rajkot",
  },
  {
    ROLLNO: 102,
    SNAME: "Krisha",
    DEPARTMENT: "EC",
    FEES: 8000,
    SEM: 5,
    GENDER: "Female",
    CITY: "Ahmedabad",
  },
  {
    ROLLNO: 103,
    SNAME: "Priti",
    DEPARTMENT: "Civil",
    FEES: 12000,
    SEM: 7,
    GENDER: "Female",
    CITY: "Baroda",
  },
  {
    ROLLNO: 104,
    SNAME: "Mitul",
    DEPARTMENT: "CE",
    FEES: 15000,
    SEM: 3,
    GENDER: "Male",
    CITY: "Rajkot",
  },
  {
    ROLLNO: 105,
    SNAME: "Keshav",
    DEPARTMENT: "CE",
    FEES: 15000,
    SEM: 3,
    GENDER: "Male",
    CITY: "Jamnagar",
  },
  {
    ROLLNO: 106,
    SNAME: "Zarna",
    DEPARTMENT: "Civil",
    FEES: 12000,
    SEM: 5,
    GENDER: "Female",
    CITY: "Ahmedabad",
  },
  {
    ROLLNO: 107,
    SNAME: "Nima",
    DEPARTMENT: "EE",
    FEES: 9000,
    SEM: 5,
    GENDER: "Female",
    CITY: "Rajkot",
  },
  {
    ROLLNO: 108,
    SNAME: "Dhruv",
    DEPARTMENT: "Mechanical",
    FEES: 10000,
    SEM: 5,
    GENDER: "Male",
    CITY: "Rajkot",
  },
  {
    ROLLNO: 109,
    SNAME: "Krish",
    DEPARTMENT: "Mechanical",
    FEES: 10000,
    SEM: 7,
    GENDER: "Male",
    CITY: "Baroda",
  },
  {
    ROLLNO: 110,
    SNAME: "Zeel",
    DEPARTMENT: "EE",
    FEES: 9000,
    SEM: 3,
    GENDER: "Female",
    CITY: "Jamnagar",
  },
]);

// 1. Display Female students.
db.STUDENT.find({ GENDER: "Female" });

// 2. Display students who belong to Rajkot city.
db.STUDENT.find({ CITY: "Rajkot" });

// 3. Display students studying in 7th sem.
db.STUDENT.find({ SEM: 7 });

// 4. Display students not studying in 3rd sem.
db.STUDENT.find({ SEM: { $ne: 3 } });

// 5. Display students whose roll no is greater than 107.
db.STUDENT.find({ ROLLNO: { $gt: 107 } });

// 6. Display students whose city is Jamnagar or Baroda (use: IN).
db.STUDENT.find({ CITY: { $in: ["Jamnagar", "Baroda"] } });

// 7. Display students whose fees is less than 9000.
db.STUDENT.find({ FEES: { $lt: 9000 } });

// 8. Display the roll no of those students who belong to the Mechanical department.
db.STUDENT.find({ DEPARTMENT: "Mechanical" }, { ROLLNO: 1, _id: 0 });

// 9. Display the first 2 students' names who live in Baroda.
db.STUDENT.find({ CITY: "Baroda" }, { SNAME: 1, _id: 0 }).limit(2);

// 10. Display Male students who are studying in 3rd sem.
db.STUDENT.find({ GENDER: "Male", SEM: 3 });

// 11. Display SNAME, CITY, and FEES of those students whose roll no is less than 105.
db.STUDENT.find(
  { ROLLNO: { $lt: 105 } },
  { SNAME: 1, CITY: 1, FEES: 1, _id: 0 }
);

// 12. Display documents where SNAME starts with K.
db.STUDENT.find({ SNAME: { $regex: /^K/ } });

// 13. Display documents where SNAME starts with Z or D in your collection.
db.STUDENT.find({ SNAME: { $regex: /^[ZD]/ } });

// 14. Display documents where CITY starts with A to R in your collection.
db.STUDENT.find({ CITY: { $regex: /^[A-R]/ } });

// 15. Display students’ info whose name starts with P and ends with i.
db.STUDENT.find({ SNAME: { $regex: /^P.*i$/ } });

// 16. Display students’ info whose department name starts with ‘C’.
db.STUDENT.find({ DEPARTMENT: { $regex: /^C/ } });

// 17. Display SNAME, SEM, FEES, and DEPARTMENT of students whose CITY contains ‘med’ as three letters somewhere in CITY name.
db.STUDENT.find(
  { CITY: { $regex: /med/ } },
  { SNAME: 1, SEM: 1, FEES: 1, DEPARTMENT: 1, _id: 0 }
);

// 18. Display SNAME, SEM, FEES, and DEPARTMENT of students who do not belong to CITY Rajkot or Baroda.
db.STUDENT.find(
  { CITY: { $nin: ["Rajkot", "Baroda"] } },
  { SNAME: 1, SEM: 1, FEES: 1, DEPARTMENT: 1, _id: 0 }
);

// 19. Delete the documents whose CITY is Jamnagar.
db.STUDENT.deleteMany({ CITY: "Jamnagar" });

// 20. Update SNAME of Krish to ‘fenny’ and GENDER to ‘Female’.
db.STUDENT.updateOne(
  { SNAME: "Krish" },
  { $set: { SNAME: "fenny", GENDER: "Female" } }
);
