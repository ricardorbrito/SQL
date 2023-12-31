:

Temp Tables - Temporary Tables

COMMENTS:
-- YOU CAN HIT OFF THIS TEMP TABLE MULTIPLE TIMES.YOU CANNOT DO IT WITH CTE OR A SUBQUERY BECAUSE YOU CAN ONLY USE THEM ONE TIME.
-- EXTREMELY USEFUL.
-- YOU CREATE A TEMP TABLE USING POUND SIGN OR HASHTAG. THE UNIQUE DIFFERENCE BETWEEN A TABLE AND A TEM TABLE IS THE POUND SIGN AT THE BEGNING OF CREATING TABLE.
 

CREATE TABLE #temp_Employee (
EmployeeID int,
Salary int,
Bonus int
)

SELECT *
FROM #temp_Employee

--INSERTING VALUE BY VALUE
INSERT INTO #temp_Employee VALUES (
1001, 45000, 2000
)

--BRINGING VALUES FROM OTHER TABLE OR SUBSET OF OTHER TABLE
INSERT INTO #temp_Employee VALUES
SELECT *
FROM EMPLOYEESALARY

/*COMMENTS: 
THIS IS ONE OF THE BIG USE OF TEMP TABLE: LETS THINK THE EMPLOYEESALARY TABLE HAS 500 MILLION ROWS, AND WE WANT TO HIT A COMPLEX QUERY OFF OF IT
USING JOINS, WINDOW FUNCTIONS AND DIFFERENT THINGS. IT WILL TAKE LONG TIME TO HIT OFF OF THIS. WE CAN INSERT THAT DATA INTO A TEMP TABLE AND THEN
WE CAN HIT OFF THE TEMP TABLE BECAUSE IT ALREADY HAVE THAT SUBSECTION DATA THAT WE WANT TO USE FOR ALL LATER QUERIES.
*/

CREATE TABLE #Temp_Employee2(
JobTitle nvarchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EMPLOYEE AS EMP
JOIN EMPLOYEESALARY AS SAL
	ON EMP.EmployeeID = SAL.EmployeeID
WHERE JobTitle IS NOT NULL
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2

--COMMENTS:
-- WE DONT NEED TO WRITE THE SELECT STATEMENT MANY TIMES
-- USEFULL IF YOU WANT TO RUN FURTHER CALCULATIONS FROM THIS VALUES WITHOUT RUN THE SELECT STATEMENT EVERY SINGLE TIME
-- REDUCE RUNTIME DRAMATICALLY
-- USED IN STORE PROCEDURES


DROP TABLE IF EXISTS #Temp_Employee2
--COMMENTS:
/*LETS IMAGINE WE HAVE A STORE PROCEDURE SET UP, WE RUN THE STORED PROCEDURE AND WE HAVE AN OUTPUT. LATER, YOU NEED TO RUN THE STORED PROCEDURE AGAIN 
AND WE GET THIS ERROR: THIS TEMP TABLE LEAVES IN SOMEWHERE. USE 'DROP TABLE IF EXISTS' TO AVOID THIS.
*/
-- INSERT IT IN THE STORED PROCEDURE INITIAL ROWS
-- IT HELPS IF YOU NEED RUN MULTIPLE TIMES
-- IT IS A REALLY GOOD THING TO DO





