mysql> CREATE database StudentManagement;
Query OK, 1 row affected (0.01 sec)
mysql> use StudentManagement;
Database changed
mysql> CREATE TABLE Students(StudentID INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(50),Gender CHAR(1),Age INT,Grade VARCHAR(2),MathScore INT,ScienceScore INT,EnglishScore INT);
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(001,"Dhanshri Mane",'F',20,"A",78,98,90);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(002,"Kaveri Potale",'F',20,"B",60,78,80);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(003,"Aboli Patule",'F',20,"A",80,78,80);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(004,"Shreeyash Mandge",'F',20,"B",75,78,70);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(005,"Sangram Palande",'M',20,"C",75,65,60);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(006,"Surabh yadav",'M',20,"C",70,65,60);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(007,"Devyani Patil",'F',20,"B",80,75,70);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(008,"Harshada Mahajan",'F',20,"A",90,85,80);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(008,"Aditya patil",'M',20,"F",27,25,20);
ERROR 1062 (23000): Duplicate entry '8' for key 'students.PRIMARY'
mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(009,"Aditya patil",'M',20,"F",27,25,20);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students(StudentID,Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) VALUES(009,"Avanti Memane",'F',20,"B",84,79,78);


/* Show details of students*/
mysql> SELECT * FROM Students;
+-----------+------------------+--------+------+-------+-----------+--------------+--------------+------------+
| StudentID | Name             | Gender | Age  | Grade | MathScore | ScienceScore | EnglishScore | TotalMarks |
+-----------+------------------+--------+------+-------+-----------+--------------+--------------+------------+
|         1 | Dhanshri Mane    | F      |   20 | A     |        78 |           98 |           90 |       NULL |
|         2 | Kaveri Potale    | F      |   20 | B     |        60 |           78 |           80 |       NULL |
|         3 | Aboli Patule     | F      |   20 | A     |        80 |           78 |           80 |       NULL |
|         4 | Shreeyash Mandge | M      |   20 | B     |        75 |           78 |           70 |       NULL |
|         5 | Sangram Palande  | M      |   20 | C     |        75 |           65 |           60 |       NULL |
|         6 | Surabh yadav     | M      |   20 | C     |        70 |           65 |           60 |       NULL |
|         7 | Devyani Patil    | F      |   20 | B     |        80 |           75 |           70 |       NULL |
|         8 | Harshada Mahajan | F      |   20 | A     |        90 |           85 |           80 |       NULL |
|         9 | Aditya patil     | M      |   20 | F     |        27 |           25 |           20 |       NULL |
|        10 | Avanti Memane    | F      |   20 | B     |        84 |           79 |           78 |       NULL |
+-----------+------------------+--------+------+-------+-----------+--------------+--------------+------------+
10 rows in set (0.00 sec)

/* Average subject score*/
mysql> SELECT AVG(MathScore) AS AVGMATH FROM Students;
+---------+
| AVGMATH |
+---------+
| 71.9000 |
+---------+
1 row in set (0.00 sec)

mysql> SELECT AVG(ScienceScore) AS AVGSCIENCE FROM Students;
+------------+
| AVGSCIENCE |
+------------+
|    72.6000 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(EnglishScore) AS AVGENGLISH FROM Students;
+------------+
| AVGENGLISH |
+------------+
|    68.8000 |
+------------+
1 row in set (0.00 sec)


/*Top Student*/
mysql> SELECT StudentID,
    ->        Name,
    ->        MathScore + ScienceScore + EnglishScore AS Totalmarks
    -> FROM Students
    -> WHERE (MathScore + ScienceScore + EnglishScore) =
    ->       (SELECT MAX(MathScore + ScienceScore + EnglishScore) FROM Students);
+-----------+---------------+------------+
| StudentID | Name          | Totalmarks |
+-----------+---------------+------------+
|         1 | Dhanshri Mane |        266 |
+-----------+---------------+------------+
1 row in set (0.00 sec)


/* count students as per grades*/
mysql> SELECT COUNT(Name) AS STUDENT_COUNT FROM STudents WHERE Grade="A" ;
+---------------+
| STUDENT_COUNT |
+---------------+
|             3 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(Name) AS STUDENT_COUNT FROM STudents WHERE Grade="B" ;
+---------------+
| STUDENT_COUNT |
+---------------+
|             4 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(Name) AS STUDENT_COUNT FROM STudents WHERE Grade="C" ;
+---------------+
| STUDENT_COUNT |
+---------------+
|             2 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(Name) AS STUDENT_COUNT FROM STudents WHERE Grade="D" ;
+---------------+
| STUDENT_COUNT |
+---------------+
|             0 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(Name) AS STUDENT_COUNT FROM STudents WHERE Grade="F" ;
+---------------+
| STUDENT_COUNT |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)


/* Average score as per gender */
mysql> SELECT Gender, AVG(MathScore+ScienceScore+EnglishScore) From Students WHERE Gender='F';
+--------+------------------------------------------+
| Gender | AVG(MathScore+ScienceScore+EnglishScore) |
+--------+------------------------------------------+
| F      |                                 240.5000 |
+--------+------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT Gender, AVG(MathScore+ScienceScore+EnglishScore) From Students WHERE Gender='M';
+--------+------------------------------------------+
| Gender | AVG(MathScore+ScienceScore+EnglishScore) |
+--------+------------------------------------------+
| M      |                                 172.5000 |
+--------+------------------------------------------+
1 row in set (0.00 sec)

/* Students Who scored above 80n marks in maths*/
mysql> SELECT StudentID,Name,MathScore FROM Students WHERE MathScore>=80;
+-----------+------------------+-----------+
| StudentID | Name             | MathScore |
+-----------+------------------+-----------+
|         3 | Aboli Patule     |        80 |
|         7 | Devyani Patil    |        80 |
|         8 | Harshada Mahajan |        90 |
|        10 | Avanti Memane    |        84 |
+-----------+------------------+-----------+
4 rows in set (0.00 sec)

/*Updating students marks*/
mysql> UPDATE Students SET MathScore=82 WHERE StudentID=002;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM STudents;
+-----------+------------------+--------+------+-------+-----------+--------------+--------------+------------+
| StudentID | Name             | Gender | Age  | Grade | MathScore | ScienceScore | EnglishScore | TotalMarks |
+-----------+------------------+--------+------+-------+-----------+--------------+--------------+------------+
|         1 | Dhanshri Mane    | F      |   20 | A     |        78 |           98 |           90 |       NULL |
|         2 | Kaveri Potale    | F      |   20 | B     |        82 |           78 |           80 |       NULL |
|         3 | Aboli Patule     | F      |   20 | A     |        80 |           78 |           80 |       NULL |
|         4 | Shreeyash Mandge | M      |   20 | B     |        75 |           78 |           70 |       NULL |
|         5 | Sangram Palande  | M      |   20 | C     |        75 |           65 |           60 |       NULL |
|         6 | Surabh yadav     | M      |   20 | C     |        70 |           65 |           60 |       NULL |
|         7 | Devyani Patil    | F      |   20 | B     |        80 |           75 |           70 |       NULL |
|         8 | Harshada Mahajan | F      |   20 | A     |        90 |           85 |           80 |       NULL |
|         9 | Aditya patil     | M      |   20 | F     |        27 |           25 |           20 |       NULL |
|        10 | Avanti Memane    | F      |   20 | B     |        84 |           79 |           78 |       NULL |
+-----------+------------------+--------+------+-------+-----------+--------------+--------------+------------+
10 rows in set (0.00 sec)

mysql>
