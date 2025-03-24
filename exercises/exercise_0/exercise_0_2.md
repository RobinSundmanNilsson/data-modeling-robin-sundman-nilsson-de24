## 2. Library Bookly

### A library called Bookly keeps track of books and members who borrow them. Each book has a title, author, and ISBN number. Each member has a membership ID, name, and contact information. A member can borrow multiple books, but each book can be borrowed by only one member at a time.

a) Identify the entities and attributes for each entity.

We have two main entities: Book and Member, but we can also have a Loan entity if we want to track the history of the books.

1. Book Table

    - book_id (primary key)
    - title
    - author
    - ISBN number

2. Member Table

    - member_id
    - name
    - contact_info

3. Loan Table

    - loan_id (primary key)
    - book_id (foreign key > Book Table)
    - member_id (foreign key > Member Table)
    - loan_date
    - return_date

b) Determine the relationship between Member, Book and Loan.

If we add the Loan Table, we can manage more loans per book and member.

One member can have multiple loans > 1-to-many between Member and Loan.

One book can be loaned multiple times > 1-to-many between Book and Loan.


With this solution we can keep track over previous loans, track which books are borrowed,
and manage returns with "return_date" in the Loan Table.

c) Draw a conceptual ERD using crow foots notation.

![alt text](exercise_0_2C.png)