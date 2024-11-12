
CREATE TABLE Patient ( 
 Patient_ID int,
 First_Name varchar(50),
 Last_Name varchar(50),
 Nationality varchar(50),
 Gender varchar(1),
 PRIMARY KEY (Patient_ID)
);

CREATE TABLE Department (
 Department_ID int,
 Department_name varchar(50),
 PRIMARY KEY (Department_ID)
);

CREATE TABLE Chiropractic (
 Chiropractic_ID int,
 First_name varchar(50),
 Last_name varchar(50),
 Department_ID int,
 FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE,
 PRIMARY KEY (Chiropractic_ID)
);

CREATE TABLE Appointment (
 Appointment_ID int, 
 Appointment_number int,
 Appointment_type varchar(200),
 Appointment_created datetime,
 Appointment_date int,
 Patient_ID int,
 Chiropractic_ID int,
 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
 FOREIGN KEY (Chiropractic_ID) REFERENCES Chiropractic(Chiropractic_ID) ON DELETE CASCADE,
 PRIMARY KEY (Appointment_ID)
);

CREATE TABLE Insurance (
 Insurance_ID int,
 Policy_no varchar(50),
 Ins_code varchar(50),
 Publish_date datetime,
 Expire_date datetime,
 Patient_ID int,
 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
 PRIMARY KEY (Insurance_ID)
);

CREATE TABLE Bill (
 Bill_id int,
 Patient_type varchar(50),
 Chiropractic_charge int,
 Balm_charge int,
 Room_charge int,
 Operation_charge int,
 Nursing_charge int,
 Machine_charge int,
 Total_bill int,
 Patient_ID int,
 Insurance_ID int,
 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
 FOREIGN KEY (Insurance_ID) REFERENCES Insurance(Insurance_ID) ON DELETE CASCADE,
 PRIMARY KEY (Bill_id)
);

CREATE TABLE Insurance_Cover (
 Cover_ID int,
 Ins_code varchar(50),
 Insurance_company varchar(50),
 Insurance_ID int,
 FOREIGN KEY (Insurance_ID) REFERENCES Insurance(Insurance_ID) ON DELETE CASCADE,
 PRIMARY KEY (Cover_ID)
);


CREATE TABLE X_ray (
 X_Ray_ID int,
 Machine_no varchar(50),
 Test_type varchar(50),
 Weight_no int,
 Height_no int,
 Muscle_Type varchar(50),
 Temperature float,
 Date_time datetime,
 Patient_type varchar(50),
 Xray_report varchar(50),
 Patient_ID int,
 PRIMARY KEY (X_Ray_ID),
 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE

);

CREATE TABLE Radiograph_Price (
 Radiograph_Price_ID int,
 X_Ray_ID int,
 Bill_ID int,
 FOREIGN KEY (X_Ray_ID) REFERENCES X_ray(X_Ray_ID),
 FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_id) ON DELETE CASCADE,
 PRIMARY KEY (Radiograph_Price_ID)
);


CREATE TABLE Supplier (
 Supplier_ID int,
 Supplier_company varchar(50),
 Phone int,
 email varchar(200),
 Address_no varchar(200),
 PRIMARY KEY (Supplier_ID)
);

CREATE TABLE Balm (
 Balm_ID int,
 Balm_name varchar(50),
 Balm_type varchar(50),
 Balm_cost varchar(50),
 Balm_ingredients varchar(50),
 Supplier_ID int,
 PRIMARY KEY (Balm_ID),
 FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID) ON DELETE CASCADE
);


CREATE TABLE Patient_Report (
 Report_ID int,
 Diagnose varchar(50),
 Reference varchar(50),
 Balm_name varchar(50),
 Balm_ID int,
 Patient_ID int,
 Chiropractic_ID int,
 PRIMARY KEY (Report_ID),
 FOREIGN KEY (Balm_ID) REFERENCES Balm(Balm_ID) ON DELETE CASCADE,
 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
 FOREIGN KEY (Chiropractic_ID) REFERENCES Chiropractic(Chiropractic_ID) ON DELETE CASCADE

);

CREATE TABLE Prescriptions (
 Prescription_ID int,
 Report_ID int,
 PRIMARY KEY (Prescription_ID),
 FOREIGN KEY (Report_ID) REFERENCES Patient_Report(Report_ID) ON DELETE CASCADE


);

CREATE TABLE Pre_Med (
Balm_ID int,
Prescription_ID int,
 FOREIGN KEY (Balm_ID) REFERENCES Balm(Balm_ID),
 FOREIGN KEY (Prescription_ID) REFERENCES Prescriptions(Prescription_ID) ON DELETE CASCADE
);

CREATE TABLE Rehab_Center ( 
 Rehab_center_ID int,
 Rehab_center_name varchar(50),
 Hospital_type varchar(50),
 Area varchar(50), 
 Road varchar(50), 
 Building varchar(50), 
 Country varchar(50), 
 PRIMARY KEY (Rehab_center_ID)
);

CREATE TABLE Room ( 
 Room_ID int,
 Room_type varchar(50),
 Status_ varchar(50),
 Rehab_center_ID int,
 Patient_ID int,
 PRIMARY KEY (Room_ID),
 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
 FOREIGN KEY (Rehab_center_ID) REFERENCES Rehab_Center(Rehab_center_ID) ON DELETE CASCADE
);

CREATE TABLE Rehab_Center_Contact (
 Contact_ID int,
 Phone int,
 Email varchar(50),
 Rehab_center_ID int, 
 PRIMARY KEY (Contact_ID),
 FOREIGN KEY (Rehab_center_ID) REFERENCES Rehab_Center(Rehab_center_ID) ON DELETE CASCADE
);

INSERT INTO Patient
VALUES
(1, 'Bayram','Huyut', 'TR', 'E'),
(2, 'Yasin','Acer', 'US', 'E'),
(3, 'Begüm', 'Gökmen', 'ES', 'K');

INSERT INTO Department
VALUES
(1, 'Kas hastalıkları'),
(2, 'Kemik ve Eklem Hastalıkları');

INSERT INTO Chiropractic
VALUES
(1, 'Oğuz', 'Ak', 1),
(2, 'Ekrem', 'Kutbay', 2);

alter table Appointment
alter column Appointment_date date;
INSERT INTO Appointment
VALUES
(1, 100, 'FDR Smart Cihaz ile', '2024-01-9', '2023-01-10', 1, 1),
(2, 200, 'FDX Visionary Cihaz ile', '2024-01-10', '2023-01-11', 2, 2);


INSERT INTO Insurance
VALUES
(1, 245, 145, '2023-01-11', '2025-01-11', 1),
(2, 246, 175, '2020-03-12', '2024-03-12', 2);

INSERT INTO Bill
VALUES
(1, 'Ayakta', 250, 36, 165, 500, 410, 25, 1386, 1, 1),
(2, 'Yatış', 200, 30, 160, 600, 460, 25, 1475, 2, 2);

INSERT INTO Insurance_Cover
VALUES
(1, '2xz', 'urm', 1),
(2, '4xt', 'uzh', 2);

INSERT INTO X_ray
VALUES
(1, '12', 'kas doku filmi' , 60, 170, 20, 36, '2024-01-11', 'Ayakta', '+', 1),
(2, '24', 'kemik doku filmi', 65, 182, 20, 36, '2024-01-11', 'Ayakta', '-', 2);

INSERT INTO Radiograph_Price
VALUES
(1, 1, 1),
(2, 2, 2);

alter table Supplier
alter column email varchar(20);

INSERT INTO Supplier
VALUES
(1, 'xyzw', 44422, 'metehangul@makroilac.com.tr', '255'),
(2, 'wyzx', 44423, 'cagriulusu@bayer.com.tr', '589');

INSERT INTO Balm
VALUES
(1, 'Dolgit', 'Kas Gevşetici', 35, 'kas gevşetici', 1),
(2, 'Diclomec', 'Kas Gevşetici', 35, 'kas gevşetici', 2);

INSERT INTO Patient_Report
VALUES
(1, 'Çikik', 'Dr. Oğuz Ak', 'Dolgit', 1, 1, 1),
(2, 'Skolyoz', 'Dr. Ekrem Kutbay', 'Diclomec', 2, 2, 2);


INSERT INTO Prescriptions
VALUES
(1, 1),
(2, 2);


INSERT INTO Pre_Med
VALUES
(1, 1),
(2, 2);

INSERT INTO Rehab_Center
VALUES
(1, 'Karyopraktik Merkezim', 'Özel', 'Kadiköy', 'Çiçek Sokak', 'no56', 'türkiye'),
(2, 'Bahçelievler Devlet', 'Devlet', 'Şirinevler', 'Kocasinan Merkez', 'no6', 'türkiye');

INSERT INTO Room
VALUES
(1, '2 kişilik', 'dolu', 1, 1),
(2, '1 kişilik', 'boş', 2, 2);



INSERT INTO Rehab_Center_Contact
VALUES
(1, 44423, 'xxx@', 1),
(2, 44423, 'xvx@', 2);



/*Retrieve All Patients' Information:*/
 SELECT * FROM Patient;

/*Find Appointments for a Specific Date:Retrieve all appointments scheduled for a specific date.
*/
 SELECT * FROM Appointment WHERE Appointment_date = '2024-01-10';
 
/*Update Email Address of a Supplier:Description: Change the email address of a supplier with a specific Supplier_ID*/
 
 UPDATE Supplier SET email = 'newemail@example.com' WHERE Supplier_ID = 1;

/*List All Chiropractics in a Given Department:Description: Retrieve all chiropractics working in a specific department*/
 
SELECT * FROM Chiropractic WHERE Department_ID = 1;


/*Delete a Patient Record:Description: Remove a patient's record from the database.*/

DELETE FROM Patient WHERE Patient_ID = 3;

/*Count the Number of Appointments for Each Chiropractic:*/

SELECT Chiropractic_ID, COUNT(*) AS NumberOfAppointments FROM Appointment GROUP BY Chiropractic_ID;
 

/*View Bills Exceeding a Certain Amount:Description: Retrieve all bills where the total amount exceeds a specified value.*/
 
SELECT * FROM Bill WHERE Total_bill > 1000;


/*Find Patients with Expired Insurance:Description: List all patients whose insurance has expired.*/

SELECT Patient.*
FROM Patient
JOIN Insurance ON Patient.Patient_ID = Insurance.Patient_ID
WHERE Insurance.Expire_date < GETDATE();


/*Retrieve Patient Reports for a Specific Chiropractic:Description: Get all patient reports handled by a particular chiropractic.*/
 
SELECT * FROM Patient_Report WHERE Chiropractic_ID = 1;


/*Update Room Status in a Rehab Center:Description: Change the status of a room in a specific rehab center.*/

UPDATE Room SET Status_ = 'boş' WHERE Room_ID = 1 AND Rehab_center_ID = 1;

-- View Example: View to display patient reports along with prescribed medications
CREATE VIEW PatientReportMedicationView AS
SELECT 
    PR.Report_ID,
    PR.Diagnose,
    PR.Reference,
    PR.Balm_name AS Prescribed_Balm,
    M.Balm_name AS Medication_Name
FROM Patient_Report PR
JOIN Pre_Med PM ON PR.Balm_ID = PM.Balm_ID
JOIN Balm M ON PM.Balm_ID = M.Balm_ID;

CREATE PROCEDURE CalculateTotalBill(IN pPatientID INT)
BEGIN
    DECLARE totalCharge INT;

    SELECT
        Chiropractic_charge + Balm_charge + Room_charge + Operation_charge + Nursing_charge + Machine_charge
    INTO
        totalCharge
    FROM
        Bill
    WHERE
        Patient_ID = pPatientID;

    UPDATE Bill
    SET Total_bill = totalCharge
    WHERE
        Patient_ID = pPatientID;
END;

CREATE TRIGGER AfterPrescriptionInsert
AFTER INSERT ON Prescriptions
FOR EACH ROW
BEGIN
    DECLARE pDiagnose VARCHAR(50);
    DECLARE pReference VARCHAR(50);

    -- You may set diagnose and reference values based on your logic.
    SET pDiagnose = 'Some Diagnose';
    SET pReference = 'Some Reference';

    INSERT INTO Patient_Report (Diagnose, Reference, Balm_name, Balm_ID, Patient_ID, Chiropractic_ID)
    VALUES (pDiagnose, pReference, 'Some Balm', NEW.Balm_ID, NEW.Report_ID, 1);
END;









