CREATE TABLE class(
                      classID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                      className VARCHAR(30),
                      startDate DATETIME,
                      status BIT
);
CREATE TABLE student(
                        studentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        studentName VARCHAR(50),
                        address VARCHAR(50),
                        phone VARCHAR(50) ,
                        status BIT,
                        classID INT,
                        FOREIGN KEY (classID) REFERENCES class(classID)
);
CREATE TABLE subject(
                        subID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                        subName VARCHAR(50),
                        credit INT,
                        status BIT
);
CREATE TABLE mark(
                     markID INT AUTO_INCREMENT PRIMARY KEY ,
                     subID INT,
                     FOREIGN KEY (subID)REFERENCES subject(subID),
                     studentID INT,
                     FOREIGN KEY (studentID)REFERENCES student(studentID),
                     mark INT,
                     examTime INT
);
INSERT INTO class (classID, className, startDate, status) VALUE (1,'A1','2008-12-20',1),(2,'A2','2008-12-22',1),(3,'B3',CURRENT_DATE,0);
INSERT INTO student (studentName, address, phone, status, classID) VALUE ('huy','thai binh','971365312',1,1);
INSERT INTO student (studentName, address, status, classID) VALUE ('hoa','hai phong',1,1);
INSERT INTO student (studentName, address, phone, status, classID) VALUE ('manh','hcm','1234567',0,2);
INSERT INTO subject (subID, subName, credit, status) VALUE (1,'CF',5,1),(2,'C',6,1),(3,'HDj',5,1),(4,'RDBMS',10,1);
INSERT INTO mark (subID, studentID, mark, examTime) VALUE (1,1,8,1),(1,3,10,2),(2,1,7,1);
SELECT address, COUNT(studentID) AS 'so luong hoc sinh' FROM student
GROUP BY address;
SELECT S.studentID,S.studentName,AVG(mark) FROM student S join mark M on S.studentID=M.studentID
GROUP BY S.studentID, S.studentName
    # HAVING AVG(mark)>9;
HAVING AVG(mark)>=ALL (SELECT AVG(mark) FROM mark GROUP BY mark.studentID);