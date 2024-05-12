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






