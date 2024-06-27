use hospitaldatabasemanagementsystem;

/*
5. Required Queries- for each query describe in simple English intended goal
a. Basic Selects
i. Simple one
Retrieve all the information about the Patients
*/
select * from Patients;

/*
ii. With Order by
Get the list of all the medicine names order by the the medication name in descending order
*/
select medicationname from medications order by medicationname desc;

/*
iii. Use of Distinct (ensure your data as info that may result in duplicates)
Get the list of distinct speciality among the doctos in our hospital
*/
select distinct speciality from doctors;

/*
iv. AND / OR in Where clause
Get the first name and last name of the nurses who work in the Morning or last name of the nurse is "Pala"
*/

select firstname, lastname, shift from nurses where shift = "Morning" or lastname = "Pala";

/*
v. Use of IN
Get the information about the wards with id 601, 602, and 604
*/

select * from wards where wardid in (601, 602, 604);


/*
vi. Use of Like
Get the information of patients with the first names starting with "A"
*/
select * from patients where firstname like "A%";

/*
b. Aggregate functions
i. Demonstrate the use of 3
*/

/*
use of count function 
 Get the count of all the patients
*/
select count(*) as PatientsCount from Patients;


/*
use of min function
Get the details of the Oldest aged patient
 */
select * from patients where dateofbirth = (select min(dateofbirth) from patients);

/*
use of max function
Get the details of the Youngest aged patient
 */
select * from patients where dateofbirth = (select max(dateofbirth) from patients);


/*
c. Joins
i. Self join
Get the list of Doctors and their speciality who have the same speciality
*/

select d1.firstname as Doctor1FirstName, D2.firstname as Doctor2FirstName, d1.speciality from Doctors D1
join Doctors D2 on D1.speciality = D2. speciality
where D1.DoctorID < D2.DoctorID;

/*
ii. inner join
list the prescription id, medication id, medication name and dosage for each of the prescription medication
*/

select prescriptionid, m.medicationid, m.medicationname, m.dosage from prescriptions p 
 inner join medications m on p.medicationid = m.medicationid order by prescriptionid;

/*
iii. outer join

list all the medications and prescriptions, including the medications that have never been prescribed.
*/

select  m.medicationId,p.prescriptionid, m.medicationname, m.dosage from medications m  left outer join prescriptions p on m.medicationID = p.medicationID;

/*
d. Group by
i. With Having

Get the DoctorID, Doctor full Name, and count of the appointments who has more than one appointment.
*/

select d.doctorid, concat(d.firstname, " ", d.lastname) as DoctorName, count(a.appointmentid) as NumberOfAppointments from Doctors d
inner join appointments a on d.doctorid = a.doctorid
group by d.doctorID having count(a.appointmentID) > 1;

/*
e. Views
• Minimum of 3
*/

/*
view-1
Create a view that has unique list of specialities of doctor
*/

create view distinctspeciality as select distinct speciality from doctors;
select * from distinctspeciality;

/*
view-2
Create a view that have names of the patients and their respective wards names assigned to them
*/
create view patientsward as select concat(p.firstname, " ", p.lastname) as PatientName, w.wardname from patients p, wards w, admissions a 
where p.patientid = a.patientid and w.wardid = a.wardid;
select * from patientsward;

/*
view-3
create a view that have the names of the patients and their respective doctor names assigned to them
*/
create view patientnameXdoctorname as select concat(p.firstname, " ", p.lastname) as PatientName, concat(d.firstname, " ", d.lastname) as DoctorName from patients p, doctors d, appointments a 
where p.patientid = a.patientid and d.doctorid = a.doctorid;
select * from patientnameXdoctorname;


/*
f. SQL Triggers
i. Minimum of 3 triggers
*/

/*
trigger-1

create triggers to update the patients information based on appointments and prescription

Here the lastappointmentdate in the patients table is updated after the appointment is created for a patient in appointments table. 
We added this trigger in the appointments table after insert.

below is the query:

CREATE DEFINER=`root`@`localhost` TRIGGER `appointments_AFTER_INSERT` AFTER INSERT ON `appointments` FOR EACH ROW BEGIN
UPDATE Patients
 SET LastAppointmentDate = NEW.AppointmentDate
 WHERE PatientID = NEW.PatientID;
END
*/

/*
trigger-2

create triggers to convert the patients firstname and lastname into uppercase

Here the firstname and lastname of the patients table is converted to uppercase before the insert trigger
we added trigger in the patients table.

below is the query:


CREATE DEFINER=`root`@`localhost` TRIGGER `patients_BEFORE_INSERT` BEFORE INSERT ON `patients` FOR EACH ROW BEGIN
set new.firstname = upper(new.firstname);
set new.lastname = upper(new.lastname);
END

*/



/*
trigger-3

Here the firstname and lastname of the nurse table is converted to lower before the insert trigger
we added trigger in the nurse table.

below is the query:

CREATE DEFINER=`root`@`localhost` TRIGGER `nurses_BEFORE_INSERT` BEFORE INSERT ON `nurses` FOR EACH ROW BEGIN
set new.firstname = lower(new.firstname);
set new.lastname = lower(new.lastname);
END

*/



