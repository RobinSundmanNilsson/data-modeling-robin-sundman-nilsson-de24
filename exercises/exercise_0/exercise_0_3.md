## 3. Conceptual ERD to words

### This is an ERD conceptual diagram that a database designer and the business stakeholders agreed upon in a car rental company called Carent.

![alt text](exercise_0_3.png)

### a) Describe the entities in this conceptual ERD.

Carent's database is built around three main entities; Customer, Rental & Car.

    Customer represents individuals who rent cars.

    Rental represents a transaction where a customer rents a car.

    Car represents the vehicles available for rent.


A customer can rent multiple cars at different times, each transaction is linked to one uniqe customer.

A rental represents the transaction where a customer rents a car. A customer can have multiple rentals, but each rental belongs to only one customer.

A car can be rented multiple times, but only by one customer at a time.

### b) Write out the relationship labels.

Customer > Rental = "makes" or "has"

Car > Rental = "is assigned to" or "is rented to"

### c) Describe the relationships between the entities (one-to-many, one-to-one and many-to-many).

Cutomer > Rental (one-to-many)("makes" or "has")

    One customer can make one or more rentals but every rental belongs to only one customer.

Car > Rental (one-to-many)("is assigned to" or "is rented to")

    One car can appear in multiple rental transactions over time, but during each rental, it belongs to only one customer.

### d) Define the relationship statement for example: "A Customer can have one or more Rentals".

1. A Customer can have one or more Rentals.

2. A Rental must belong to exactly one Customer.

3. A Car can be assigned to one or more Rentals over time.

4. A Rental must be associated with exactly one Car.