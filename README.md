# HospitalDatabaseManagementSystem

The project is about the Hospital Database Management System. This database has 8 tables. They are Patients, Doctors, Nurses, Appointments, Medications, Wards, Admissions, Prescriptions. 

Foreign key relation:
-> The appointments table has two foreign keys. PatientID from the Patients table and DoctorID from the Doctor Table.
->The admissions table has two foreign keys. PatientID from the Patients table and WardID from the Wards Table
->The prescriptions table has two foreign keys. PatientID from the Patients table and MedicationID from the Medications table

Now let us understand the partial and total participations & Cardinality between the entities from the ER diagram:
Patients and Appointments:
Here we have partial participation from the patient because the patient can exist without an appointment. That means he or she can directly come to the hospital without an appointment. But Every appointment must involve a patient, which means every appointment record must have a valid PatientID and thus we have total participation from appointments entity. One patient can have and book N appointments at different times. Thus, we can say that the cardinality is one-to-many (1:N) from patients to appointments. 

Appointments and Doctors:
Here we have a total participation from the appointments entity. This is because the appointments are meant to assign each of the patient to the doctors. Not every doctor must have appointments all the time. Doctors can exist without having a scheduled appointments. The cardinality is many-to-one(N:1) because multiple appointments are assigned to a single doctor.


Patients and Prescriptions:

Here we have a partial participation from the patients entity because patients can exits without having a prescription and just have a normal checkup without prescription. But we have total participation from the prescriptions entity. It is because every prescription must be associated with a specific patient. The cardinality is one-to-one (1:1) from patients to prescriptions. Each patients can have only one prescription at a time and every prescription must have a patientID.

Prescriptions and Medications:
Here we have a total participation from the prescriptions entity because every prescription must involve at least one medication. This means every record in the prescription entity must refer to a valid MedicationID. Not every medication should be prescribed at any given time, which means that a medication can exist without being part of any prescription, and thus we can say that we have partial participation from the medication. Each prescription will have more than one medications and thus we can say that we will have one-to-many(1:N) cardinality from Prescription to Medications entity.


Other than the above mentioned relationships, all the entities have 1:1 cardinality with partial participation.
-> In the database, I used the yyyy-mm-dd format for the dates. This helped me to find the oldest and youngest patients based on their DateOfBirth.
-> The DischargeDate in the admissions table can be NULL because we don't know how long it takes to cure the patients problem in some cases. That's the reason why we are accepting NULL values for Discharge Date.
->The Description in the Appointments table refers to the pre suggestion given by the doctor to the patient before the appointment.
->Each nurse will work only in one of the shifts. (i.e. Morning, Evening, Night). We have evening shift because there will be heavy a flow of patients for their regular checkup.
-> LastAppointmentDate in the Patients table can be null because the new patient will not have any previous history of appointments. 
 

