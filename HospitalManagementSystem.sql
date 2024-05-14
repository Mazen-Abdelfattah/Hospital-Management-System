<<<<<<< HEAD
CREATE DATABASE HospitalManagementSystem


USE HospitalManagementSystem


CREATE TABLE Admin
(
    admin_id INT PRIMARY KEY IDENTITY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    name     VARCHAR(30) NOT NULL,
);

CREATE TABLE Medication
(
    medication_id INT PRIMARY KEY IDENTITY,
    name          VARCHAR(30)  NOT NULL,
    description   VARCHAR(200) NOT NULL,
    dosage        VARCHAR(200)  NOT NULL,
);

CREATE TABLE Patient
(
    patient_id              INT PRIMARY KEY IDENTITY,
    name                    VARCHAR(30)   NOT NULL,
    age                     DECIMAL(3, 1) NOT NULL,
    gender                  CHAR(1)       NOT NULL,
    date_of_birth           DATE          NOT NULL,
    address                 VARCHAR(30)   NOT NULL,
    phone_number            VARCHAR(20)   NOT NULL,
    emergency_contact_name  VARCHAR(30)   NOT NULL,
    emergency_contact_phone VARCHAR(30)   NOT NULL,
    insurance_information   VARCHAR(30)   NOT NULL,
    admin_id                INT,
    medication_id           INT,
    FOREIGN KEY (medication_id) REFERENCES Medication (medication_id),
    FOREIGN KEY (admin_id) REFERENCES Admin (admin_id),
);

CREATE TABLE Doctor
(
    doctor_id           INT PRIMARY KEY IDENTITY,
    name                VARCHAR(30) NOT NULL,
    department          VARCHAR(30) NOT NULL,
    Specialty           VARCHAR(30) NOT NULL,
    years_of_experience INT         NOT NULL,
);

CREATE TABLE Nurse
(
    nurse_id            INT PRIMARY KEY IDENTITY,
    name                VARCHAR(30) NOT NULL,
    department          VARCHAR(30) NOT NULL,
    years_of_experience INT         NOT NULL,
);

CREATE TABLE Appointment
(
    appointment_id   INT PRIMARY KEY IDENTITY,
    appointment_time TIME,
    appointment_date DATE,
    patient_id       INT,
    doctor_id        INT,
    reason_for_visit VARCHAR(30),
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id),
);

CREATE TABLE Treatment
(
    treatment_id INT PRIMARY KEY IDENTITY,
    Description  VARCHAR(100)  NOT NULL,
    Cost         DECIMAL(9, 2) NOT NULL,
);

CREATE TABLE Diagnosis
(
    diagnosis_id  INT PRIMARY KEY IDENTITY,
    DiagnosisDate DATE         NOT NULL,
    DiagnosisCode INT          NOT NULL,
    Description   VARCHAR(100) NOT NULL,
    patient_id    INT,
    doctor_id     INT,
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id),
);

CREATE TABLE Room
(
    room_id    INT PRIMARY KEY IDENTITY,
    room_type  VARCHAR(100) NOT NULL, --(Single, Double)
    nurse_id   INT          NOT NULL,
    patient_id INT          NOT NULL,
    FOREIGN KEY (nurse_id) REFERENCES Nurse (nurse_id),
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
);

CREATE TABLE PatientDiagnosis
(
    patient_id   INT,
    doctor_id    INT,
    diagnosis_id INT,
    PRIMARY KEY (patient_id, doctor_id), -- Composite primary key
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id),
    FOREIGN KEY (diagnosis_id) REFERENCES Diagnosis (diagnosis_id) ON DELETE CASCADE
);

CREATE TABLE PatientMedication
(
    patient_id    INT,
    medication_id INT,
    Dosage        VARCHAR(50),               -- Assuming Dosage includes both amount and frequency
    StartDate     DATE,
    EndDate       DATE,
    PRIMARY KEY (patient_id, medication_id), -- Composite primary key
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (medication_id) REFERENCES Medication (medication_id) ON DELETE CASCADE
);

--===========================================================================================================


INSERT INTO Admin (username, password, name)
VALUES ('goku_saiyan', 'Kamehameha@2024', 'Goku'),
       ('naruto_hokage', 'Rasengan@2024', 'Naruto Uzumaki'),
       ('tonystark_ironman', 'ArcReactor@2024', 'Tony Stark'),
       ('batman_gotham', 'DarkKnight@2024', 'Bruce Wayne'),
       ('spiderman_web', 'SpideySense@2024', 'Peter Parker'),
       ('homer_simpson', 'Doh@2024', 'Homer Simpson'),
       ('spongebob_squarepants', 'BikiniBottom@2024', 'SpongeBob SquarePants'),
       ('pikachu_electric', 'Thunderbolt@2024', 'Pikachu'),
       ('mickey_mouse', 'OhBoy@2024', 'Mickey Mouse'),
       ('buzz_lightyear', 'ToInfinity@2024', 'Buzz Lightyear'),
       ('ariel_mermaid', 'UnderTheSea@2024', 'Ariel'),
       ('shrek_ogre', 'OgresAreLikeOnions@2024', 'Shrek'),
       ('harry_potter', 'Expelliarmus@2024', 'Harry Potter'),
       ('sailor_moon', 'MoonPrismPower@2024', 'Sailor Moon'),
       ('scooby_doo', 'ScoobySnack@2024', 'Scooby Doo'),
       ('james_bond', '007@2024', 'James Bond'),
       ('wonder_woman', 'LassoOfTruth@2024', 'Wonder Woman'),
       ('gandalf_grey', 'YouShallNotPass@2024', 'Gandalf'),
       ('buzz_lightyear', 'ToInfinity@2024', 'Buzz Lightyear'),
       ('ariel_mermaid', 'UnderTheSea@2024', 'Ariel');


INSERT INTO Medication (name, description, dosage)
VALUES
('Paracetamol', 'Paracetamol is a common pain reliever and fever reducer.', '500mg tablets, take 1-2 tablets every 4-6 hours as needed.'),
('Ibuprofen', 'Ibuprofen is a nonsteroidal anti-inflammatory drug (NSAID) used to relieve pain, reduce inflammation, and lower fever.', '200mg tablets, take 1-2 tablets every 4-6 hours as needed with food.'),
('Lisinopril', 'Lisinopril is used to treat high blood pressure (hypertension).', '5mg tablets, take 1 tablet daily.'),
('Metformin', 'Metformin is used to treat type 2 diabetes.', '500mg tablets, take 1 tablet twice daily with meals.'),
('Atorvastatin', 'Atorvastatin is used to lower cholesterol and reduce the risk of heart disease.', '10mg tablets, take 1 tablet daily.'),
('Amoxicillin', 'Amoxicillin is an antibiotic used to treat bacterial infections.', '250mg capsules, take 1 capsule three times daily for 7-10 days.'),
('Omeprazole', 'Omeprazole is used to treat gastroesophageal reflux disease (GERD) and other conditions caused by excess stomach acid.', '20mg capsules, take 1 capsule daily before breakfast.'),
('Simvastatin', 'Simvastatin is used to lower cholesterol and triglycerides (types of fat) in the blood.', '20mg tablets, take 1 tablet daily.'),
('Hydrochlorothiazide', 'Hydrochlorothiazide is used to treat high blood pressure (hypertension) and fluid retention (edema).', '25mg tablets, take 1 tablet daily in the morning.'),
('Losartan', 'Losartan is used to treat high blood pressure (hypertension) and to help protect the kidneys from damage due to diabetes.', '50mg tablets, take 1 tablet daily.'),
('Gabapentin', 'Gabapentin is used to treat epilepsy and nerve pain caused by shingles (herpes zoster) or other conditions.', '300mg capsules, take 1 capsule three times daily.'),
('Amlodipine', 'Amlodipine is used to treat high blood pressure (hypertension) and chest pain (angina).', '5mg tablets, take 1 tablet daily.'),
('Metoprolol', 'Metoprolol is used to treat high blood pressure (hypertension) and prevent chest pain (angina).', '50mg tablets, take 1 tablet twice daily.'),
('Albuterol', 'Albuterol is a bronchodilator that is used to treat or prevent bronchospasm in people with reversible obstructive airway disease.', '2mg tablets, take 1-2 tablets every 4-6 hours as needed.'),
('Prednisone', 'Prednisone is a corticosteroid used to treat conditions such as arthritis, blood disorders, breathing problems, severe allergies, skin diseases, cancer, eye problems, and immune system disorders.', '5mg tablets, dosage varies depending on the condition being treated.'),
('Citalopram', 'Citalopram is used to treat depression.', '20mg tablets, take 1 tablet daily.'),
('Levothyroxine', 'Levothyroxine is used to treat an underactive thyroid (hypothyroidism).', '25mcg tablets, dosage varies depending on the patient.'),
('Warfarin', 'Warfarin is used to prevent blood clots from forming or growing larger in your blood and blood vessels.', '5mg tablets, dosage varies depending on the patient and condition.'),
('Montelukast', 'Montelukast is used to prevent wheezing, difficulty breathing, chest tightness, and coughing caused by asthma.', '10mg tablets, take 1 tablet daily in the evening.');


INSERT INTO Patient (name, age, gender, date_of_birth, address, phone_number, emergency_contact_name,
                     emergency_contact_phone, insurance_information, admin_id, medication_id)
VALUES ('Alice Johnson', 45, 'F', '1979-05-15', '123 Main St', '555-1234', 'John Johnson', '555-5678',
        'Insurance Company A', 1, 21),
       ('Bob Smith', 32, 'M', '1992-10-20', '456 Oak St', '555-2345', 'Sarah Smith', '555-6789', 'Insurance Company B',
        1, 22),
       ('Carol Williams', 50, 'F', '1974-03-10', '789 Elm St', '555-3456', 'David Williams', '555-7890',
        'Insurance Company C', 2, 23),
       ('David Brown', 28, 'M', '1996-08-25', '321 Pine St', '555-4567', 'Mary Brown', '555-8901',
        'Insurance Company D', 2, 20),
       ('Emma Davis', 60, 'F', '1962-06-05', '654 Cedar St', '555-5678', 'James Davis', '555-9012',
        'Insurance Company E', 3, 5),
       ('Frank Wilson', 35, 'M', '1989-01-30', '987 Birch St', '555-6789', 'Karen Wilson', '555-0123',
        'Insurance Company F', 3, 6),
       ('Grace Anderson', 42, 'F', '1982-09-20', '852 Maple St', '555-7890', 'Michael Anderson', '555-1234',
        'Insurance Company G', 4, 7),
       ('Henry Martinez', 55, 'M', '1969-12-15', '741 Pine St', '555-8901', 'Jennifer Martinez', '555-2345',
        'Insurance Company H', 4, 8),
       ('Isabel Jackson', 48, 'F', '1976-04-25', '369 Oak St', '555-9012', 'Robert Jackson', '555-3456',
        'Insurance Company I', 5, 9),
       ('Jack Thompson', 37, 'M', '1987-07-15', '963 Elm St', '555-0123', 'Amanda Thompson', '555-4567',
        'Insurance Company J', 5, 10),
       ('Kate White', 29, 'F', '1995-02-10', '147 Cedar St', '555-1234', 'Thomas White', '555-5678',
        'Insurance Company K', 6, 11),
       ('Liam Harris', 33, 'M', '1989-11-05', '258 Birch St', '555-2345', 'Jessica Harris', '555-6789',
        'Insurance Company L', 6, 12),
       ('Mia Young', 47, 'F', '1977-08-30', '753 Maple St', '555-3456', 'William Young', '555-7890',
        'Insurance Company M', 7, 13),
       ('Noah Clark', 51, 'M', '1973-01-20', '159 Pine St', '555-4567', 'Rebecca Clark', '555-8901',
        'Insurance Company N', 7, 14),
       ('Olivia Rodriguez', 39, 'F', '1983-07-10', '357 Oak St', '555-5678', 'Richard Rodriguez', '555-9012',
        'Insurance Company O', 8, 15),
       ('Peter Garcia', 44, 'M', '1978-11-25', '852 Cedar St', '555-6789', 'Nancy Garcia', '555-0123',
        'Insurance Company P', 8, 16),
       ('Rachel Lee', 36, 'F', '1986-03-15', '963 Elm St', '555-7890', 'Christopher Lee', '555-2345',
        'Insurance Company Q', 9, 17),
       ('Samuel Martinez', 57, 'M', '1965-10-05', '357 Pine St', '555-8901', 'Laura Martinez', '555-3456',
        'Insurance Company R', 9, 18),
       ('Taylor King', 41, 'F', '1981-05-20', '753 Oak St', '555-9012', 'Daniel King', '555-4567',
        'Insurance Company S', 10, 19),
       ('William Taylor', 30, 'M', '1992-04-10', '852 Maple St', '555-0123', 'Melissa Taylor', '555-5678',
        'Insurance Company T', 10, 20);


INSERT INTO Doctor (name, department, Specialty, years_of_experience)
VALUES ('Dr. David Lee', 'Cardiology', 'Cardiologist', 15),
       ('Dr. Sarah Chen', 'Neurology', 'Neurologist', 12),
       ('Dr. Mark Davis', 'Surgery', 'Surgeon', 20),
       ('Dr. Jennifer Patel', 'Pediatrics', 'Pediatrician', 10),
       ('Dr. Lisa Kim', 'Dermatology', 'Dermatologist', 8),
       ('Dr. Michael Nguyen', 'Oncology', 'Oncologist', 18),
       ('Dr. Emily Wilson', 'Psychiatry', 'Psychiatrist', 14),
       ('Dr. Robert Garcia', 'Orthopedics', 'Orthopedic Surgeon', 22),
       ('Dr. Susan Thompson', 'Family Medicine', 'Family Physician', 11),
       ('Dr. William White', 'Urology', 'Urologist', 16),
       ('Dr. Karen Harris', 'Endocrinology', 'Endocrinologist', 9),
       ('Dr. Charles Young', 'Gastroenterology', 'Gastroenterologist', 13),
       ('Dr. Patricia Clark', 'Ophthalmology', 'Ophthalmologist', 17),
       ('Dr. Daniel Lewis', 'Pulmonology', 'Pulmonologist', 19),
       ('Dr. Jessica Hall', 'Rheumatology', 'Rheumatologist', 7),
       ('Dr. Ryan King', 'Otolaryngology', 'Otolaryngologist', 21),
       ('Dr. Maria Garcia', 'Neonatology', 'Neonatologist', 14),
       ('Dr. Kevin Rodriguez', 'Anesthesiology', 'Anesthesiologist', 18),
       ('Dr. Laura Lee', 'Allergy and Immunology', 'Allergist', 10),
       ('Dr. Jason Martinez', 'Geriatrics', 'Geriatrician', 11);


INSERT INTO Nurse (name, department, years_of_experience)
VALUES
('Nurse Alice', 'Cardiology', 5),
('Nurse Bob', 'Neurology', 7),
('Nurse Carol', 'Surgery', 3),
('Nurse David', 'Pediatrics', 6),
('Nurse Emily', 'Dermatology', 4),
('Nurse Frank', 'Oncology', 8),
('Nurse Grace', 'Psychiatry', 5),
('Nurse Henry', 'Orthopedics', 9),
('Nurse Isabel', 'Family Medicine', 4),
('Nurse Jack', 'Urology', 7),
('Nurse Kate', 'Endocrinology', 3),
('Nurse Liam', 'Gastroenterology', 6),
('Nurse Mia', 'Ophthalmology', 8),
('Nurse Noah', 'Pulmonology', 5),
('Nurse Olivia', 'Rheumatology', 4),
('Nurse Peter', 'Otolaryngology', 9),
('Nurse Rachel', 'Neonatology', 6),
('Nurse Samuel', 'Anesthesiology', 7),
('Nurse Taylor', 'Allergy and Immunology', 4),
('Nurse William', 'Geriatrics', 5);


INSERT INTO Appointment (appointment_time, appointment_date, patient_id, doctor_id, reason_for_visit)
VALUES
('09:00:00', '2024-05-15', 21, 1, 'Annual checkup'),
('10:30:00', '2024-05-15', 22, 2, 'Headache and dizziness'),
('11:45:00', '2024-05-16', 3, 3, 'Knee pain'),
('13:30:00', '2024-05-16', 20, 4, 'Stomach ache'),
('14:45:00', '2024-05-17', 5, 5, 'Skin rash'),
('09:00:00', '2024-05-17', 6, 6, 'Cancer treatment follow-up'),
('10:30:00', '2024-05-18', 7, 7, 'Depression evaluation'),
('11:45:00', '2024-05-18', 8, 8, 'Knee surgery follow-up'),
('13:30:00', '2024-05-19', 9, 9, 'Flu symptoms'),
('14:45:00', '2024-05-19', 10, 10, 'Urinary tract infection'),
('09:00:00', '2024-05-20', 11, 11, 'Diabetes checkup'),
('10:30:00', '2024-05-20', 12, 12, 'Stomach ulcer'),
('11:45:00', '2024-05-21', 13, 13, 'Eye exam'),
('13:30:00', '2024-05-21', 14, 14, 'Breathing difficulties'),
('14:45:00', '2024-05-22', 15, 15, 'Joint pain'),
('09:00:00', '2024-05-22', 16, 16, 'Ear infection'),
('10:30:00', '2024-05-23', 17, 17, 'Newborn care'),
('11:45:00', '2024-05-23', 18, 18, 'Surgery consultation'),
('13:30:00', '2024-05-24', 19, 19, 'Allergy testing'),
('14:45:00', '2024-05-24', 20, 20, 'Geriatric assessment');


INSERT INTO Treatment (Description, Cost)
VALUES
('Physical Therapy Session', 100.00),
('Dental Cleaning', 150.00),
('Eye Examination', 200.00),
('Flu Vaccination', 50.00),
('X-ray Imaging', 120.00),
('MRI Scan', 500.00),
('Blood Test', 80.00),
('Colonoscopy', 600.00),
('Chemotherapy Session', 1000.00),
('Cataract Surgery', 2000.00),
('Knee Replacement Surgery', 5000.00),
('Root Canal Treatment', 800.00),
('Appendectomy', 3000.00),
('Physical Examination', 60.00),
('Allergy Testing', 150.00),
('Prenatal Care Visit', 120.00),
('Cardiac Stress Test', 300.00),
('Sleep Study', 400.00),
('Skin Biopsy', 200.00),
('Joint Injection', 250.00);


INSERT INTO Diagnosis (DiagnosisDate, DiagnosisCode, Description, patient_id, doctor_id)
VALUES
('2024-05-01', 12345, 'Common Cold', 21, 1),
('2024-05-05', 23456, 'Influenza', 22, 2),
('2024-05-10', 34567, 'Bronchitis', 3, 3),
('2024-05-15', 45678, 'Pneumonia', 4, 4),
('2024-05-20', 56789, 'Sinusitis', 5, 5),
('2024-05-25', 67890, 'Otitis Media', 6, 6),
('2024-06-01', 12346, 'Gastritis', 7, 7),
('2024-06-05', 23457, 'Peptic Ulcer Disease', 8, 8),
('2024-06-10', 34568, 'Gastroenteritis', 9, 9),
('2024-06-15', 45679, 'Irritable Bowel Syndrome', 10, 10),
('2024-06-20', 56790, 'Crohn''s Disease', 11, 11),
('2024-06-25', 67891, 'Ulcerative Colitis', 12, 12),
('2024-07-01', 12347, 'Hypertension', 13, 13),
('2024-07-05', 23458, 'Atrial Fibrillation', 14, 14),
('2024-07-10', 34569, 'Heart Failure', 15, 15),
('2024-07-15', 45680, 'Coronary Artery Disease', 16, 16),
('2024-07-20', 56791, 'Myocardial Infarction', 17, 17),
('2024-07-25', 67892, 'Stroke', 18, 18),
('2024-08-01', 12348, 'Type 2 Diabetes', 19, 19),
('2024-08-05', 23459, 'Hypothyroidism', 20, 20);


INSERT INTO Room (room_type, nurse_id, patient_id)
VALUES
('Single', 1, 21),
('Double', 2, 22),
('Single', 3, 3),
('Double', 4, 4),
('Single', 5, 5),
('Double', 6, 6),
('Single', 7, 7),
('Double', 8, 8),
('Single', 9, 9),
('Double', 10, 10),
('Single', 11, 11),
('Double', 12, 12),
('Single', 13, 13),
('Double', 14, 14),
('Single', 15, 15),
('Double', 16, 16),
('Single', 17, 17),
('Double', 18, 18),
('Single', 19, 19),
('Double', 20, 20);


INSERT INTO PatientDiagnosis (patient_id, doctor_id, diagnosis_id)
VALUES
(21, 1, 21),
(22, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20);


INSERT INTO PatientMedication (patient_id, medication_id, Dosage, StartDate, EndDate)
VALUES
(21, 21, '1 tablet daily', '2024-05-01', '2024-05-15'),
(22, 22, '2 tablets daily', '2024-05-02', '2024-05-16'),
(3, 23, '1 tablet twice daily', '2024-05-03', '2024-05-17'),
(4, 20, '1 tablet daily', '2024-05-04', '2024-05-18'),
(5, 5, '1 tablet daily', '2024-05-05', '2024-05-19'),
(6, 6, '1 capsule three times daily', '2024-05-06', '2024-05-20'),
(7, 7, '1 capsule daily before breakfast', '2024-05-07', '2024-05-21'),
(8, 8, '1 tablet daily', '2024-05-08', '2024-05-22'),
(9, 9, '1 tablet daily in the morning', '2024-05-09', '2024-05-23'),
(10, 10, '1 tablet daily', '2024-05-10', '2024-05-24'),
(11, 11, '1 capsule three times daily', '2024-05-11', '2024-05-25'),
(12, 12, '1 tablet daily', '2024-05-12', '2024-05-26'),
(13, 13, '1 capsule daily before breakfast', '2024-05-13', '2024-05-27'),
(14, 14, '1 tablet daily', '2024-05-14', '2024-05-28'),
(15, 15, '1 tablet daily in the evening', '2024-05-15', '2024-05-29'),
(16, 16, '1 tablet daily', '2024-05-16', '2024-05-30'),
(17, 17, '1 tablet daily', '2024-05-17', '2024-06-01'),
(18, 18, '1 tablet daily in the morning', '2024-05-18', '2024-06-02'),
(19, 19, '1 tablet daily', '2024-05-19', '2024-06-03'),
(20, 20, '1 tablet daily', '2024-05-20', '2024-06-04');


-- SELECT @@SERVERNAME
=======
CREATE DATABASE HospitalManagementSystem

USE HospitalManagementSystem


CREATE TABLE Admin
(
    admin_id INT PRIMARY KEY IDENTITY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    name     VARCHAR(30) NOT NULL,
);

CREATE TABLE Doctor
(
    doctor_id     INT PRIMARY KEY IDENTITY,
    username      VARCHAR(30) NOT NULL,
    password      VARCHAR(30) NOT NULL,
    name          VARCHAR(30) NOT NULL,
    specification VARCHAR(30) NOT NULL,
);

CREATE TABLE Medicine
(
    medicine_id INT PRIMARY KEY IDENTITY,
    name        VARCHAR(30)  NOT NULL,
    details     VARCHAR(100) NOT NULL,
);

CREATE TABLE MedicalHistory
(
    medical_history_id INT PRIMARY KEY IDENTITY,
    record_details     VARCHAR(100) NOT NULL,
    patient_id         INT,
);

CREATE TABLE Patient
(
    patient_id         INT PRIMARY KEY IDENTITY,
    name               VARCHAR(30)   NOT NULL,
    age                DECIMAL(3, 1) NOT NULL,
    gender             CHAR(1)       NOT NULL,
    medical_history_id INT,
    medicine_id        INT,
    admin_id           INT,
    FOREIGN KEY (medical_history_id) REFERENCES MedicalHistory (medical_history_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine (medicine_id),
    FOREIGN KEY (admin_id) REFERENCES Admin (admin_id),
);

CREATE TABLE Appointment
(
    appointment_id INT PRIMARY KEY IDENTITY,
    time           DATETIME,
    date           DATE,
    patient_id     INT,
    doctor_id      INT,
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id),
);

CREATE TABLE Nurse
(
    nurse_id INT PRIMARY KEY IDENTITY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    name     VARCHAR(30) NOT NULL,
);


INSERT INTO Admin (username, password, name)
VALUES ('goku_saiyan', 'Kamehameha@2024', 'Goku'),
       ('naruto_hokage', 'Rasengan@2024', 'Naruto Uzumaki'),
       ('tonystark_ironman', 'ArcReactor@2024', 'Tony Stark'),
       ('batman_gotham', 'DarkKnight@2024', 'Bruce Wayne'), --Leave this Admin for me XD
       ('spiderman_web', 'SpideySense@2024', 'Peter Parker'),
       ('homer_simpson', 'Doh@2024', 'Homer Simpson'),
       ('spongebob_squarepants', 'BikiniBottom@2024', 'SpongeBob SquarePants'),
       ('pikachu_electric', 'Thunderbolt@2024', 'Pikachu'),
       ('mickey_mouse', 'OhBoy@2024', 'Mickey Mouse'),
       ('buzz_lightyear', 'ToInfinity@2024', 'Buzz Lightyear'),
       ('ariel_mermaid', 'UnderTheSea@2024', 'Ariel'),
       ('shrek_ogre', 'OgresAreLikeOnions@2024', 'Shrek'),
       ('harry_potter', 'Expelliarmus@2024', 'Harry Potter'),
       ('sailor_moon', 'MoonPrismPower@2024', 'Sailor Moon'),
       ('scooby_doo', 'ScoobySnack@2024', 'Scooby Doo'),
       ('james_bond', '007@2024', 'James Bond'),
       ('wonder_woman', 'LassoOfTruth@2024', 'Wonder Woman'),
       ('gandalf_grey', 'YouShallNotPass@2024', 'Gandalf'),
       ('buzz_lightyear', 'ToInfinity@2024', 'Buzz Lightyear'),
       ('ariel_mermaid', 'UnderTheSea@2024', 'Ariel');


INSERT INTO Doctor (username, password, name, specification)
VALUES ('dr_david_lee', 'Cardio@2024', 'Dr. David Lee', 'Cardiologist'),
       ('dr_sarah_chen', 'Neuro@2024', 'Dr. Sarah Chen', 'Neurologist'),
       ('dr_mark_davis', 'Surgeon@2024', 'Dr. Mark Davis', 'Surgeon'),
       ('dr_jennifer_patel', 'Pediatric@2024', 'Dr. Jennifer Patel', 'Pediatrician'),
       ('dr_lisa_kim', 'Derm@2024', 'Dr. Lisa Kim', 'Dermatologist'),
       ('dr_michael_nguyen', 'Oncology@2024', 'Dr. Michael Nguyen', 'Oncologist'),
       ('dr_emily_wilson', 'Psych@2024', 'Dr. Emily Wilson', 'Psychiatrist'),
       ('dr_robert_garcia', 'Ortho@2024', 'Dr. Robert Garcia', 'Orthopedic Surgeon'),
       ('dr_susan_thompson', 'FamilyDoc@2024', 'Dr. Susan Thompson', 'Family Physician'),
       ('dr_william_white', 'Urology@2024', 'Dr. William White', 'Urologist'),
       ('dr_karen_harris', 'Endo@2024', 'Dr. Karen Harris', 'Endocrinologist'),
       ('dr_charles_young', 'Gastro@2024', 'Dr. Charles Young', 'Gastroenterologist'),
       ('dr_patricia_clark', 'EyeDoc@2024', 'Dr. Patricia Clark', 'Ophthalmologist'),
       ('dr_daniel_lewis', 'LungDoc@2024', 'Dr. Daniel Lewis', 'Pulmonologist'),
       ('dr_jessica_hall', 'Rheuma@2024', 'Dr. Jessica Hall', 'Rheumatologist'),
       ('dr_ryan_king', 'ENT@2024', 'Dr. Ryan King', 'Otolaryngologist'),
       ('dr_maria_garcia', 'Neo@2024', 'Dr. Maria Garcia', 'Neonatologist'),
       ('dr_kevin_rodriguez', 'Anesth@2024', 'Dr. Kevin Rodriguez', 'Anesthesiologist'),
       ('dr_laura_lee', 'Allergy@2024', 'Dr. Laura Lee', 'Allergist'),
       ('dr_jason_martinez', 'Geriatric@2024', 'Dr. Jason Martinez', 'Geriatrician');


INSERT INTO Medicine (name, details)
VALUES ('Paracetamol', 'Pain relief and fever reducer'),
       ('Amoxicillin', 'Antibiotic'),
       ('Ibuprofen', 'Nonsteroidal anti-inflammatory'),
       ('Loratadine', 'Antihistamine'),
       ('Omeprazole', 'Proton pump inhibitor'),
       ('Atorvastatin', 'Cholesterol-lowering medication'),
       ('Metformin', 'Antidiabetic medication'),
       ('Sertraline', 'Antidepressant'),
       ('Lisinopril', 'Antihypertensive'),
       ('Albuterol', 'Bronchodilator'),
       ('Warfarin', 'Anticoagulant'),
       ('Gabapentin', 'Anticonvulsant'),
       ('Furosemide', 'Diuretic'),
       ('Metoprolol', 'Beta blocker'),
       ('Simvastatin', 'Cholesterol-lowering medication'),
       ('Citalopram', 'Antidepressant'),
       ('Azithromycin', 'Antibiotic'),
       ('Hydrochlorothiazide', 'Diuretic'),
       ('Amlodipine', 'Antihypertensive'),
       ('Tramadol', 'Pain medication');


INSERT INTO MedicalHistory (record_details, patient_id)
VALUES ('Previous heart surgery, currently on blood pressure meds', 1),
       ('Allergic to penicillin, history of asthma', 2),
       ('Diabetes type 2, taking insulin', 3),
       ('No major medical history', 4),
       ('History of cancer, currently in remission', 5),
       ('Migraine headaches, taking medication', 6),
       ('High cholesterol, taking statins', 7),
       ('Osteoarthritis, managing with physical therapy', 8),
       ('Allergic to shellfish, no other allergies', 9),
       ('Chronic back pain, undergoing physical therapy', 10),
       ('Anxiety disorder, taking medication', 11),
       ('Hypothyroidism, taking medication', 12),
       ('Seasonal allergies, taking antihistamines', 13),
       ('Asthma, using inhaler as needed', 14),
       ('History of stroke, managing with medication', 15),
       ('GERD, taking medication', 16),
       ('Depression, undergoing therapy', 17),
       ('High blood pressure, managing with medication', 18),
       ('Diabetic neuropathy, managing with medication', 19),
       ('Healthy with no major medical issues', 20);


INSERT INTO Patient (name, age, gender, medical_history_id, medicine_id, admin_id)
VALUES ('Alice Johnson', 45, 'F', 1, 1, 1),
       ('Bob Smith', 32, 'M', 2, 2, 1),
       ('Carol Williams', 50, 'F', 3, 3, 2),
       ('David Brown', 28, 'M', 4, 4, 2),
       ('Emma Davis', 60, 'F', 5, 5, 3),
       ('Frank Wilson', 35, 'M', 6, 6, 3),
       ('Grace Anderson', 42, 'F', 7, 7, 4),
       ('Henry Martinez', 55, 'M', 8, 8, 4),
       ('Isabel Jackson', 48, 'F', 9, 9, 5),
       ('Jack Thompson', 37, 'M', 10, 10, 5),
       ('Kate White', 29, 'F', 11, 11, 6),
       ('Liam Harris', 33, 'M', 12, 12, 6),
       ('Mia Young', 47, 'F', 13, 13, 7),
       ('Noah Clark', 51, 'M', 14, 14, 7),
       ('Olivia Rodriguez', 39, 'F', 15, 15, 8),
       ('Peter Garcia', 44, 'M', 16, 16, 8),
       ('Rachel Lee', 36, 'F', 17, 17, 9),
       ('Samuel Martinez', 57, 'M', 18, 18, 9),
       ('Taylor King', 41, 'F', 19, 19, 10),
       ('William Taylor', 30, 'M', 20, 20, 10);



INSERT INTO Appointment (time, date, patient_id, doctor_id)
VALUES ('2024-05-10 09:00:00', '2024-05-10', 21, 1),
       ('2024-05-11 10:30:00', '2024-05-11', 2, 2),
       ('2024-05-12 13:45:00', '2024-05-12', 3, 3),
       ('2024-05-13 11:00:00', '2024-05-13', 4, 4),
       ('2024-05-14 14:30:00', '2024-05-14', 5, 5),
       ('2024-05-15 10:15:00', '2024-05-15', 6, 6),
       ('2024-05-16 13:00:00', '2024-05-16', 7, 7),
       ('2024-05-17 09:30:00', '2024-05-17', 8, 8),
       ('2024-05-18 12:45:00', '2024-05-18', 9, 9),
       ('2024-05-19 08:30:00', '2024-05-19', 10, 10),
       ('2024-05-20 15:00:00', '2024-05-20', 11, 11),
       ('2024-05-21 11:30:00', '2024-05-21', 12, 12),
       ('2024-05-22 14:15:00', '2024-05-22', 13, 13),
       ('2024-05-23 09:45:00', '2024-05-23', 14, 14),
       ('2024-05-24 12:00:00', '2024-05-24', 15, 15),
       ('2024-05-25 10:00:00', '2024-05-25', 16, 16),
       ('2024-05-26 13:30:00', '2024-05-26', 17, 17),
       ('2024-05-27 08:45:00', '2024-05-27', 18, 18),
       ('2024-05-28 11:15:00', '2024-05-28', 19, 19),
       ('2024-05-29 14:45:00', '2024-05-29', 20, 20);


INSERT INTO Nurse (username, password, name)
VALUES ('nurse_jenny', 'NurseJ@2024', 'Jenny Smith'),
       ('nurse_mike', 'NurseM@2024', 'Mike Johnson'),
       ('nurse_emily', 'NurseE@2024', 'Emily Davis'),
       ('nurse_chris', 'NurseC@2024', 'Chris Anderson'),
       ('nurse_laura', 'NurseL@2024', 'Laura Martinez'),
       ('nurse_alex', 'NurseA@2024', 'Alex Brown'),
       ('nurse_rachel', 'NurseR@2024', 'Rachel Taylor'),
       ('nurse_brian', 'NurseB@2024', 'Brian Wilson'),
       ('nurse_sarah', 'NurseS@2024', 'Sarah Clark'),
       ('nurse_peter', 'NurseP@2024', 'Peter Rodriguez'),
       ('nurse_mary', 'NurseM@2024', 'Mary Lee'),
       ('nurse_jack', 'NurseJ@2024', 'Jack Garcia'),
       ('nurse_olivia', 'NurseO@2024', 'Olivia White'),
       ('nurse_daniel', 'NurseD@2024', 'Daniel Harris'),
       ('nurse_linda', 'NurseL@2024', 'Linda Thompson'),
       ('nurse_kyle', 'NurseK@2024', 'Kyle Hall'),
       ('nurse_anna', 'NurseA@2024', 'Anna King'),
       ('nurse_josh', 'NurseJ@2024', 'Joshua Martinez'),
       ('nurse_amy', 'NurseA@2024', 'Amy Lewis'),
       ('nurse_matt', 'NurseM@2024', 'Matthew Brown');



CREATE TABLE Operation
(
    operation_id INT PRIMARY KEY IDENTITY,
    details      VARCHAR(100) NOT NULL,
    patient_id   INT          NOT NULL,
    doctor_id    INT          NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id),
);

CREATE TABLE Room
(
    room_id      INT PRIMARY KEY IDENTITY,
    equipment    VARCHAR(100) NOT NULL,
    operation_id INT          NOT NULL,
    nurse_id     INT          NOT NULL,
    patient_id   INT          NOT NULL,
    FOREIGN KEY (operation_id) REFERENCES Operation (operation_id),
    FOREIGN KEY (nurse_id) REFERENCES Nurse (nurse_id),
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
);

INSERT INTO Operation (details, patient_id, doctor_id) VALUES
('Heart bypass surgery', 21, 1),
('Brain tumor removal', 2, 2),
('Knee replacement surgery', 3, 3),
('Appendectomy', 4, 4),
('Skin grafting', 5, 5),
('Chemotherapy session', 6, 6),
('Psychiatric evaluation', 7, 7),
('Hip replacement surgery', 8, 8),
('Family medicine consultation', 9, 9),
('Urinary tract surgery', 10, 10),
('Thyroid gland surgery', 11, 11),
('Colonoscopy', 12, 12),
('Eye cataract surgery', 13, 13),
('Lung function test', 14, 14),
('Rheumatoid arthritis treatment', 15, 15),
('Ear, nose, and throat examination', 16, 16),
('Neonatal intensive care', 17, 17),
('Anesthesia administration', 18, 18),
('Allergy testing', 19, 19),
('Geriatric care assessment', 20, 20);

INSERT INTO Room (equipment, operation_id, nurse_id, patient_id) VALUES
('Surgical tools', 21, 1, 21),
('MRI machine', 2, 2, 2),
('Operating table', 3, 3, 3),
('Endoscopy equipment', 4, 4, 4),
('Dermatology chair', 5, 5, 5),
('Chemotherapy chair', 6, 6, 6),
('Counseling room setup', 7, 7, 7),
('Orthopedic surgery table', 8, 8, 8),
('General examination tools', 9, 9, 9),
('Urology procedure chair', 10, 10, 10),
('Endocrine system testing equipment', 11, 11, 11),
('Gastrointestinal examination tools', 12, 12, 12),
('Ophthalmology examination tools', 13, 13, 13),
('Pulmonary function testing equipment', 14, 14, 14),
('Rheumatology examination setup', 15, 15, 15),
('ENT examination tools', 16, 16, 16),
('Neonatal care unit setup', 17, 17, 17),
('Anesthesia administration setup', 18, 18, 18),
('Allergy testing equipment', 19, 19, 19),
('Geriatric care examination setup', 20, 20, 20);

-- SELECT @@SERVERNAME






>>>>>>> c6420734514198c8ebce8c47e94dc4f549c5efe9
