//use yourDatabaseName;  // Switch to your database (create one if it doesn't exist)

// Insert the documents into the EMPLOYEE collection
db.EMPLOYEE.insertMany([
  {
    EID: 1,
    ENAME: "Nick",
    GENDER: "Male",
    JOININGDATE: new Date("2013-01-01"),
    SALARY: 4000,
    CITY: "London",
  },
  {
    EID: 2,
    ENAME: "Julian",
    GENDER: "Female",
    JOININGDATE: new Date("2014-10-01"),
    SALARY: 3000,
    CITY: "New York",
  },
  {
    EID: 3,
    ENAME: "Roy",
    GENDER: "Male",
    JOININGDATE: new Date("2016-06-01"),
    SALARY: 3500,
    CITY: "London",
  },
  {
    EID: 4,
    ENAME: "Tom",
    GENDER: "Male",
    JOININGDATE: null,
    SALARY: 4500,
    CITY: "London",
  },
  {
    EID: 5,
    ENAME: "Jerry",
    GENDER: "Male",
    JOININGDATE: new Date("2013-02-01"),
    SALARY: 2800,
    CITY: "Sydney",
  },
  {
    EID: 6,
    ENAME: "Philip",
    GENDER: "Male",
    JOININGDATE: new Date("2015-01-01"),
    SALARY: 7000,
    CITY: "New York",
  },
  {
    EID: 7,
    ENAME: "Sara",
    GENDER: "Female",
    JOININGDATE: new Date("2017-08-01"),
    SALARY: 4800,
    CITY: "Sydney",
  },
  {
    EID: 8,
    ENAME: "Emily",
    GENDER: "Female",
    JOININGDATE: new Date("2015-01-01"),
    SALARY: 5500,
    CITY: "New York",
  },
  {
    EID: 9,
    ENAME: "Michael",
    GENDER: "Male",
    JOININGDATE: null,
    SALARY: 6500,
    CITY: "London",
  },
  {
    EID: 10,
    ENAME: "John",
    GENDER: "Male",
    JOININGDATE: new Date("2015-01-01"),
    SALARY: 8800,
    CITY: "London",
  },
]);

// 1. Display employees whose gender is Male.
db.EMPLOYEE.find({ GENDER: "Male" });

// 2. Display employees who belong to London city.
db.EMPLOYEE.find({ CITY: "London" });

// 3. Display employees whose salary is greater than 3500.
db.EMPLOYEE.find({ SALARY: { $gt: 3500 } });

// 4. Display employees whose joining date is before 2015-01-01.
db.EMPLOYEE.find({ JOININGDATE: { $lt: new Date("2015-01-01") } });

// 5. Display employees whose EID is greater than or equal to 7.
db.EMPLOYEE.find({ EID: { $gte: 7 } });

// 6. Display employees whose city is London or New York (use: IN).
db.EMPLOYEE.find({ CITY: { $in: ["London", "New York"] } });

// 7. Display employees who do not belong to London or New York (use: NOT IN).
db.EMPLOYEE.find({ CITY: { $nin: ["London", "New York"] } });

// 8. Display the EID of those employees who live in the city of London.
db.EMPLOYEE.find({ CITY: "London" }, { EID: 1, _id: 0 });

// 9. Display the first 2 employee names who live in New York.
db.EMPLOYEE.find({ CITY: "New York" }, { ENAME: 1, _id: 0 }).limit(2);

// 10. Display the next 2 employees after skipping the first 2 whose city is London.
db.EMPLOYEE.find({ CITY: "London" }).skip(2).limit(2);

// 11. Display Male employees who live in Sydney.
db.EMPLOYEE.find({ GENDER: "Male", CITY: "Sydney" });

// 12. Display EID, ENAME, CITY, and SALARY of those employees who belong to London or Sydney.
db.EMPLOYEE.find(
  { CITY: { $in: ["London", "Sydney"] } },
  { EID: 1, ENAME: 1, CITY: 1, SALARY: 1, _id: 0 }
);

// 13. Display ENAME, SALARY, and CITY of those employees whose salary is more than 7000.
db.EMPLOYEE.find(
  { SALARY: { $gt: 7000 } },
  { ENAME: 1, SALARY: 1, CITY: 1, _id: 0 }
);

// 14. Display documents whose name starts with E.
db.EMPLOYEE.find({ ENAME: { $regex: /^E/ } });

// 15. Display documents whose name starts with S or M in your collection.
db.EMPLOYEE.find({ ENAME: { $regex: /^[SM]/ } });

// 16. Display documents where city starts with A to M in your collection.
db.EMPLOYEE.find({ CITY: { $regex: /^[A-M]/ } });

// 17. Display documents where city name ends in ‘ney’.
db.EMPLOYEE.find({ CITY: { $regex: /ney$/ } });

// 18. Display employee info whose name contains 'n'. (Both uppercase(N) and lowercase(n)).
db.EMPLOYEE.find({ ENAME: { $regex: /n/i } });

// 19. Display employee info whose name starts with E and has 5 characters.
db.EMPLOYEE.find({ ENAME: { $regex: /^E.{4}$/ } });

// 20. Display employees whose name starts with S and ends in 'a'.
db.EMPLOYEE.find({ ENAME: { $regex: /^S.*a$/ } });

// 21. Display EID, ENAME, CITY, and SALARY whose name starts with ‘Phi’.
db.EMPLOYEE.find(
  { ENAME: { $regex: /^Phi/ } },
  { EID: 1, ENAME: 1, CITY: 1, SALARY: 1, _id: 0 }
);

// 22. Display ENAME, JOININGDATE, and CITY whose city contains ‘dne’ as three letters in the city name.
db.EMPLOYEE.find(
  { CITY: { $regex: /dne/ } },
  { ENAME: 1, JOININGDATE: 1, CITY: 1, _id: 0 }
);

// 23. Display ENAME, JOININGDATE, and CITY who do not belong to the city of London or Sydney.
db.EMPLOYEE.find(
  { CITY: { $nin: ["London", "Sydney"] } },
  { ENAME: 1, JOININGDATE: 1, CITY: 1, _id: 0 }
);

// 24. Delete the documents whose city is New York.
db.EMPLOYEE.deleteMany({ CITY: "New York" });

// 25. Update ENAME of Nick to ‘Naysa’ and GENDER to ‘Female’.
db.EMPLOYEE.updateOne(
  { ENAME: "Nick" },
  { $set: { ENAME: "Naysa", GENDER: "Female" } }
);
