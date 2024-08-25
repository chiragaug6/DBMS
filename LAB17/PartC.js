// 1. Display the next 2 students after skipping the first 2 whose city is Ahmedabad.
db.STUDENT.find({ CITY: "Ahmedabad" }).skip(2).limit(2);

// 2. Display rollno, sname, fees, and department of those students who are from Baroda and belong to the CE department.
db.STUDENT.find(
  { CITY: "Baroda", DEPARTMENT: "CE" },
  { ROLLNO: 1, SNAME: 1, FEES: 1, DEPARTMENT: 1, _id: 0 }
);

// 3. Display documents where city name ends in ‘oda’.
db.STUDENT.find({ CITY: { $regex: /oda$/ } });

// 4. Display students’ info whose name contains 'v' (both uppercase 'V' and lowercase 'v').
db.STUDENT.find({ SNAME: { $regex: /v/i } });

// 5. Display students’ info whose name starts with V and has 4 characters.
db.STUDENT.find({ SNAME: { $regex: /^V.{3}$/ } });
