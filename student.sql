SELECT * FROM students_performance.student;
with CTE_analysis as(
SELECT * ,ROW_NUMBER() OVER (partition by Exam_score ,Hours_Studied , Access_to_Resources , 
Gender ,Motivation_Level , Parental_Education_Level , 
Parental_Involvement ,School_Type ,Learning_Disabilities , Peer_Influence ,Peer_Influence, Previous_Scores, Family_Income ,Sleep_Hours
) As row_id 
FROM students_performance.student)

select *
from CTE_analysis
where row_id>1;

SELECT
    Gender,
    AVG(Previous_Scores) AS average_previous_score,
    AVG(Exam_Score) AS current_average_score
FROM studentperformance
GROUP BY Gender; 

Select Gender, avg(Hours_Studied) as avg_hour
,AVG(Sleep_Hours) as avg_sleep
FROM student
group by gender;
SELECT Gender , COUNT(Physical_Activity) AS PHYSISCAL_EXERCISE
from
student
group by gender;
SELECT Gender , avg(Exam_Score) as exam,
avg(Previous_Scores) as previous, 
((avg(Exam_Score) / avg(Previous_Scores))*100) as percentage_change
FROM student
group by Gender;
select 
case
when Exam_Score < 50 then 'less than 50'
when Exam_Score <60 then '50-60'
when Exam_Score < 70 then '60-70'
when Exam_Score < 80 then '70-80'
when Exam_Score < 90 then '80-90'
when Exam_Score <100 then '90-100'
end AS SCORE_RANGE,
count(*) as total_student
from student
group by SCORE_RANGE;

select 
case
when Previous_Scores < 50 then 'less than 50'
when Previous_Scores <60 then '50-60'
when Previous_Scores < 70 then '60-70'
when Previous_Scores < 80 then '70-80'
when Previous_Scores < 90 then '80-90'
when Previous_Scores < 100 then '90-100'
else 'above 100'
end AS Previous,
count(*) as total_student
from student
group by Previous;

select 
case
when Previous_Scores < 50 then 'less than 50'
when Previous_Scores <60 then '50-60'
when Previous_Scores < 70 then '60-70'
when Previous_Scores < 80 then '70-80'
when Previous_Scores < 90 then '80-90'
when Previous_Scores < 100 then '90-100'
else 'above 100'
end AS Previous,
count(*) as total_student
from student
group by Previous;
select Gender , min(Previous_Scores) as minmum_Previous_Scores,max(Previous_Scores) as maximum_Previous_Scores ,
min(Exam_Score) as minimum_exam_score, max(Exam_score) as max_exam_score
from student
group by Gender;
select 
case
when Exam_Score < 50 then 'less than 50'
when Exam_Score <60 then '50-60'
when Exam_Score < 70 then '60-70'
when Exam_Score < 80 then '70-80'
when Exam_Score < 90 then '80-90'
when Exam_Score <=100then '90-100'
end AS SCORE_RANGE,
count(*) as total_student
from student
group by SCORE_RANGE;

select 
case
when Exam_Score < 50 then 'less than 50'
when Exam_Score <60 then '50-60'
when Exam_Score < 70 then '60-70'
when Exam_Score < 80 then '70-80'
when Exam_Score < 90 then '80-90'
when Exam_Score < 100 then '90-100'
else 'nograde'
end AS Previous,
count(*) as total_student
from student
group by Previous;

select 
case
when Previous_Scores < 50 then 'less than 50'
when Previous_Scores <60 then '50-60'
when Previous_Scores < 70 then '60-70'
when Previous_Scores < 80 then '70-80'
when Previous_Scores < 90 then '80-90'
when Previous_Scores < 100 then '90-100'
else 'no grade'
end AS Score,
count(*) as total_student
from student
group by Score;
with
 student_rank as(
select Previous_Scores, NTILE(4) OVER(ORDER BY Previous_Scores)AS
QUARTILE_GROUP
FROM student)
Select
Case QUARTILE_GROUP
WHEN 1 THEN 'Q1 (bottom-25%)'
WHEN 2 THEN 'Q2 (25-50%)'
WHEN 3 THEN 'Q3 (50-75%)'
WHEN 4 THEN 'Q4 (75-100%)'
end as quartiles,
    count(*) as total_student,
   avg(Previous_Scores) as avg_previous_Score, 
   min(Previous_Scores) as min_Previous_Score,
     max(Previous_Scores) as max_Previous_Score
from student_rank
group by QUARTILE_GROUP

order by QUARTILE_GROUP;

with
 student_rank as(
select Exam_Score, NTILE(4) OVER(ORDER BY Exam_Score)AS
quartile_group
FROM student)
Select
Case quartile_group
WHEN 1 THEN 'Q1 (bottom-25%)'
WHEN 2 THEN 'Q2 (25-50%)'
WHEN 3 THEN 'Q3 (50-75%)'
WHEN 4 THEN 'Q4 (75-100%)'
end as quartiles,
    count(*) as total_student,
   avg(Exam_Score) as avg_Exam_Score, 
   min(Exam_Score) as min_Exam_Score,
     max(Exam_Score) as max_Exam_Score
from student_rank
group by quartile_group

order by quartile_group;
select count(*) as totla_student
from student;













