## 5. University management system

### A university needs a system to manage students, courses, and professors.

    Each student can enroll in multiple courses.
    Each course is taught by one professor.
    A teacher can teach multiple courses.

a) Identify entities and their relationships

For a university management system we can identify the following main entities;

1. Student - represents students who enroll in courses.

2. Course - represents different courses offered by the university.

3. Professor - represents professors who teach courses

Relationships:

Student <-> Course (many-to-many)

    a student can enroll in multiple courses
    a course can have multiple students enrolled

    this requires a join table (enrollment) to track which students are in which courses.

Professor <-> Course (one-to-many)

    a professor can teach multiple courses
    each course is taught by one and only one professor

b) Come up with possible attributes for the entities

1. Student

    student_id (primary_key)
    name
    email

2. Enrollment (join table for Student <-> Course relationship)

    enrollment_id (primary_key)
    student_id (foreign_key > Student)
    course_id (foreign_key > Course)

3. Course

    course_id (primary_key)
    name
    credits
    professor_id (foreign_key > Professor)

4. Professor

    professor_id (primary_key)
    name
    email

c) Draw conceptual ERD with cardinalities

![alt text](exercise_0_5C.png)

d) Define business rules (e.g. a student can enroll in max 4 courses)

1. A student can enroll in a maximum of 4 courses.

2. A course must have atleas one studen enrolled.

3. A professor can teach multiple courses.

4. Each course is taught by exactly one professor.

5. A student must be enrolled in atleast one course.