 
Today:

UPDATE and DELETE

COMMENTS:
INSERT: INSERTS A NEW ROW IN THE TABLE
UPDATE: ALTERS A PREEXISTING ROW IN A TABLE. 
DELETE: ESPECIFIES WHAT ROW TO REMOVE FROM A TABLE
*/

SELECT *
FROM EMPLOYEESALARY

--SET: IS WHERE YOU ESPECIFY WHAT COLUMN AND WHAT VALUE YOU WANT TO INSERT IN THAT CELL
UPDATE EMPLOYEESALARY
SET EmployeeID = 1013
WHERE Salary = NULL AND Bonus = 800

UPDATE EMPLOYEE
SET JobTitle = 'Salesman'
WHERE EmployeeID = 1003 AND LastName = 'Green'

UPDATE EMPLOYEE
SET EmployeeID = 1008
WHERE FirstName = NULL AND MiddleName = NULL AND LastName = NULL AND Age = 35 AND Gender = NULL AND JobTitle = NULL

DELETE FROM EMPLOYEE
WHERE EmployeeID = '1005'

--SAFEGUARD SECRET: USE THE SELECT STATEMENT BEFORE USING THE DELETE. IT HELPS YOU TO CHECK IF YOU ARE DELETING THE CORRECT ROW.
SELECT *
FROM EMPLOYEE
WHERE EmployeeID = '1004'