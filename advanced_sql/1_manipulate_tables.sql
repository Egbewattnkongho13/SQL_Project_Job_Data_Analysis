CREATE TABLE job_applied (
    job_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(225),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);


INSERT INTO job_applied (application_sent_date, custom_resume, resume_file_name, cover_letter_sent, cover_letter_file_name, status)
VALUES('2024-02-01', True, 'resume_01.pdf', True, 'cover_letter_01.pdf', 'submitted'),
        ('2024-02-03', False, 'resume_02.pdf', False, NULL, 'draft'),
        ('2024-02-05', True, 'resume_03.pdf', True, 'cover_letter_03.pdf', 'submitted'),
        ('2024-02-07', False, 'resume_04.pdf', False, NULL, 'in review'),
        ('2024-02-10', True, 'resume_05.pdf', True, 'cover_letter_05.pdf', 'submitted'),
        ('2024-02-12', False, 'resume_06.pdf', False, NULL, 'rejected'),
        ('2024-02-15', True, 'resume_07.pdf', True, 'cover_letter_07.pdf', 'submitted'),
        ('2024-02-18', False, 'resume_08.pdf', False, NULL, 'draft'),
        ('2024-02-20', True, 'resume_09.pdf', True, 'cover_letter_09.pdf', 'submitted'),
        ('2024-02-22', False, 'resume_10.pdf', False, NULL, 'in review'),
        ('2024-02-25', True, 'resume_11.pdf', True, 'cover_letter_11.pdf', 'submitted'),
        ('2024-02-27', False, 'resume_12.pdf', False, NULL, 'rejected'),
        ('2024-03-01', True, 'resume_13.pdf', True, 'cover_letter_13.pdf', 'submitted'),
        ('2024-03-03', False, 'resume_14.pdf', False, NULL, 'draft'),
        ('2024-03-05', True, 'resume_15.pdf', True, 'cover_letter_15.pdf', 'submitted'),
        ('2024-03-07', False, 'resume_16.pdf', False, NULL, 'in review'),
        ('2024-03-10', True, 'resume_17.pdf', True, 'cover_letter_17.pdf', 'submitted'),
        ('2024-03-12', False, 'resume_18.pdf', False, NULL, 'rejected'),
        ('2024-03-15', True, 'resume_19.pdf', True, 'cover_letter_19.pdf', 'submitted'),
        ('2024-03-18', False, 'resume_20.pdf', False, NULL, 'draft');





SELECT * FROM job_applied;

ALTER  TABLE job_applied 
ADD COLUMN contact VARCHAR(50);

SELECT * FROM job_applied;


UPDATE job_applied SET contact = 'Elrich Bachman' WHERE job_id = 1;
UPDATE job_applied SET contact = 'Richard Hendricks' WHERE job_id = 2;
UPDATE job_applied SET contact = 'Monica Hall' WHERE job_id = 3;
UPDATE job_applied SET contact = 'Jared Dunn' WHERE job_id = 4;
UPDATE job_applied SET contact = 'Dinesh Chugtai' WHERE job_id = 5;
UPDATE job_applied SET contact = 'Bertram Gilfoyle' WHERE job_id = 6;
UPDATE job_applied SET contact = 'Nelson Bighetti' WHERE job_id = 7;
UPDATE job_applied SET contact = 'Laurie Bream' WHERE job_id = 8;
UPDATE job_applied SET contact = 'Russ Hanneman' WHERE job_id = 9;
UPDATE job_applied SET contact = 'Gavin Belson' WHERE job_id = 10;
UPDATE job_applied SET contact = 'Jack Barker' WHERE job_id = 11;
UPDATE job_applied SET contact = 'Jian-Yang' WHERE job_id = 12;
UPDATE job_applied SET contact = 'Peter Gregory' WHERE job_id = 13;
UPDATE job_applied SET contact = 'Dana' WHERE job_id = 14;
UPDATE job_applied SET contact = 'Carla Walton' WHERE job_id = 15;
UPDATE job_applied SET contact = 'Denpok' WHERE job_id = 16;
UPDATE job_applied SET contact = 'Ed Chen' WHERE job_id = 17;
UPDATE job_applied SET contact = 'Colin' WHERE job_id = 18;
UPDATE job_applied SET contact = 'Fiona' WHERE job_id = 19;
UPDATE job_applied SET contact = 'Mia' WHERE job_id = 20;


SELECT * FROM job_applied;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;

