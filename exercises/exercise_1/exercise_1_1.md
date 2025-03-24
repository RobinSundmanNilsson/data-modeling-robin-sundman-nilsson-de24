## 1. Implement hospital example in postgres

a) Now implement your physical model from e) and add the data from task 0e). Make sure that you have correctly specified different domain constraints.

I implemented the physical model in PostgreSQL using Docker. The schema included the following tables:
	•	Hospital, Department, Doctor
	•	Join tables: HospitalDepartment, HospitalDoctor, DepartmentDoctor

Domain constraints used:
	•	NOT NULL constraints on all important fields (name, address, etc.)
	•	VARCHAR(100) and VARCHAR(200) for string lengths to control data consistency
	•	Primary and foreign keys with correct relationships
	•	ON DELETE CASCADE used in join tables to enforce referential integrity

I inserted the data from task 0e, including:
	•	Two hospitals
	•	Two departments
	•	Two doctors
	•	Correct join relationships for hospitals, doctors, and departments

b) Now lets try to add a row in HospitalDepartment with a hospital_id that doesn't exist in the hospital table. What happens here and why?

```sql
INSERT INTO HospitalDepartment VALUES (999, 1);
```

Result: 
ERROR:  insert or update on table "hospitaldepartment" violates foreign key constraint 
DETAIL:  Key (hospital_id)=(999) is not present in table "hospital".

Why?
Because hospital_id = 999 does not exist in the Hospital table, the foreign key constraint prevents the insert to maintain referential integrity.

c) Do similar to b) but try adding a department_id to HospitalDepartment that doesn't exist in the Department.

```sql
INSERT INTO HospitalDepartment VALUES (1, 999);
```

Result:
ERROR:  insert or update on table "hospitaldepartment" violates foreign key constraint
DETAIL:  Key (department_id)=(999) is not present in table "department".

Why?
Same reason as above — foreign keys ensure that department_id must already exist in the Department table.

d) Now try to do normal delete a record in Hospital that the HospitalDepartment refers to. What happens?

```sql
DELETE FROM Hospital WHERE hospital_id = 1;
```

Result (before ON DELETE CASCADE was added):
ERROR:  update or delete on table "hospital" violates foreign key constraint
DETAIL:  Key (hospital_id)=(1) is still referenced from table "hospitaldepartment".

Why?
PostgreSQL blocks the delete because the hospital is referenced in the join tables. This preserves data integrity.

e) Now use delete on cascade and check what happens.

```sql
DELETE FROM Hospital WHERE hospital_id = 1;
```

Result:
DELETE 1

Then verified that related rows in HospitalDepartment and HospitalDoctor were also deleted.

Why?
With ON DELETE CASCADE, PostgreSQL automatically deletes all dependent child records when the parent is deleted.

f) Try to violate a domain constraint, what did you try and what result did you get?

```sql
INSERT INTO Doctor (name, specialty) VALUES (NULL, 'Surgeon');
```

Result:
ERROR:  null value in column "name" violates not-null constraint

Why?
The Doctor.name column has a NOT NULL constraint, so PostgreSQL rejects any attempt to insert a null value.