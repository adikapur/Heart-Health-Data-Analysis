#Description
#This dataset provides information about various factors that may be associated with the likelihood of a heart attack.
#age: Age of the patient.
#sex: Gender of the patient (Male = 1, Female = 0).
#cp: Type of chest pain (1: Typical angina, 2: Atypical angina, 3: Non-anginal pain, 4: Asymptomatic).
#trtbps: Resting blood pressure (in mm Hg).
#chol: Cholesterol level in mg/dl.
#fbs: Fasting blood sugar > 120 mg/dl (BloodSugar>120 = 1; BloodSugar<120 = 0).
#restecg: Resting electrocardiographic results (0: Normal, 1: ST-T wave abnormality, 2: Left ventricular hypertrophy).
#thalachh: Maximum heart rate achieved.
#exng: Exercise-induced angina (1 = yes; 0 = no).
#oldpeak: Depression of the ST segment induced by exercise relative to rest.
#slp: Slope of the peak exercise ST segment.
#caa: Number of major vessels (0-3).
#thall: Thalassemia type.
#output: Likelihood of a heart attack (0: Less chance, 1: More chance).
#Target Variable: The target variable 'output' is binary, indicating the likelihood of a heart attack based on the provided features—0 for less chance, 1 for more chance.
create database heart;
use heart
select * from heart.heartdata
#changing datatype of sex col to make it more readable
Alter table heartdata
modify column sex varchar(50)
#updating numeric values to string for better readability
update heartdata
set sex = 'Male'
where sex = '1'
UPDATE heartdata
SET sex = 'Female'
WHERE sex = '0';
select distinct sex from heartdata
SET SQL_SAFE_UPDATES = 0;
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'heartdata'
AND COLUMN_NAME = 'sex';
#cp: Type of chest pain (0: Typical angina, 1: Atypical angina, 2: Non-anginal pain, 3: Asymptomatic).
ALTER TABLE heartdata
MODIFY COLUMN cp VARCHAR(50);

UPDATE heartdata
SET cp = 'Typical Angina'
WHERE cp = '0';

UPDATE heartdata
SET cp = 'Atypical angina'
WHERE cp = '1';

UPDATE heartdata
SET cp = 'Non-anginal pain'
WHERE cp = '2';

UPDATE heartdata
SET cp = 'Asymptomatic'
WHERE cp = '3';
#fbs: Fasting blood sugar > 120 mg/dl (BloodSugar>120 = 1; BloodSugar<120 = 0).
alter table heartdata
modify column fbs varchar(50)
UPDATE heartdata
SET fbs = CASE
    WHEN fbs = '1' THEN 'BloodSugar>120'

    ELSE 'BloodSugar<120'
END
#output: Likelihood of a heart attack (0: Less chance, 1: More chance).
alter table heartdata
modify column output varchar(50);
UPDATE heartdata
SET output = CASE
    WHEN output = '1' THEN 'More chance of Attack'

    ELSE 'Less chance of Attack'
END
#trying to find null values
SELECT *
FROM heartdata
WHERE sex IS NULL
or age is null
or cp is null
or trtbps is null
or chol is null
or fbs is null
or restecg is null
or thalachh is null
or exng is null
or oldpeak is null
or slp is null
or caa is null
or thall is null
or output is null;
#ready for analysis
select * from heartdata
