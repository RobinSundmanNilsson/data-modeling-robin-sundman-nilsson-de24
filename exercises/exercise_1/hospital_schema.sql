-- Drop tables if they exist (order matters due to FKs)
DROP TABLE IF EXISTS DepartmentDoctor;
DROP TABLE IF EXISTS HospitalDoctor;
DROP TABLE IF EXISTS HospitalDepartment;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Hospital;

-- Create main entities
CREATE TABLE Hospital (
    hospital_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL
);

CREATE TABLE Department (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- Composite entities (join tables)

CREATE TABLE HospitalDepartment (
    hospital_id INT,
    department_id INT,
    PRIMARY KEY (hospital_id, department_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE HospitalDoctor (
    hospital_id INT,
    doctor_id INT,
    PRIMARY KEY (hospital_id, doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE DepartmentDoctor (
    department_id INT,
    doctor_id INT,
    PRIMARY KEY (department_id, doctor_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Insert sample data
INSERT INTO Hospital (name, address) VALUES
('City Hospital', '123 Main St'),
('Valley Hospital', '456 River Rd');

INSERT INTO Department (name) VALUES
('Cardiology'),
('Neurology');

INSERT INTO Doctor (name, specialty) VALUES
('Dr. Alice', 'Cardiologist'),
('Dr. Bob', 'Neurologist');

-- Join table data
INSERT INTO HospitalDepartment VALUES (1, 1), (2, 1);
INSERT INTO HospitalDoctor VALUES (1, 1), (2, 1);
INSERT INTO DepartmentDoctor VALUES (1, 1), (2, 2), (1, 2);

-- Foreign key violation test (uncomment to test)
-- INSERT INTO HospitalDepartment VALUES (999, 1); -- should fail
-- INSERT INTO HospitalDepartment VALUES (1, 999); -- should fail

-- Deletion test (uncomment to test ON DELETE CASCADE)
-- DELETE FROM Hospital WHERE hospital_id = 1;

-- Domain constraint violation test (uncomment to test NOT NULL / VARCHAR)
-- INSERT INTO Doctor (name, specialty) VALUES (NULL, 'Surgeon'); -- should fail
-- INSERT INTO Hospital (name, address) VALUES (repeat('X', 300), 'Address'); -- should fail