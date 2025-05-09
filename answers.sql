CREATE DATABASE clinic_system;
USE clinic_system;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    dob DATE,
    phone VARCHAR(15) UNIQUE
);

-- Appointments table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Treatments table
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    diagnosis TEXT,
    prescription TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Sample Data
INSERT INTO Departments (name) VALUES ('Cardiology'), ('Pediatrics');

INSERT INTO Doctors (name, specialization, department_id)
VALUES ('Dr. Smith', 'Cardiologist', 1),
       ('Dr. Jane', 'Pediatrician', 2);

INSERT INTO Patients (name, gender, dob, phone)
VALUES ('John Doe', 'Male', '1990-04-15', '1234567890'),
       ('Mary Ann', 'Female', '1985-12-03', '0987654321');


INSERT INTO Appointments (patient_id, doctor_id, appointment_date)
VALUES (1, 1, '2025-05-10 09:30:00'),
       (2, 2, '2025-05-11 14:00:00');

INSERT INTO Treatments (appointment_id, diagnosis, prescription)
VALUES (1, 'High blood pressure', 'Lisinopril 10mg daily'),
       (2, 'Flu symptoms', 'Rest, fluids, and paracetamol');
