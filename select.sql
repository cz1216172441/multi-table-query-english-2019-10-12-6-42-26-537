# 1.Query the existence of 1 course
select * from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select * from course where id = 1 or id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select stu.id, stu.name, avg(sc.score) as average_score from student stu, student_course sc
  where stu.id = sc.studentId
    group by stu.id, stu.name
      having avg(sc.score) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student stu where stu.id not in 
  (select distinct sc.studentId from student_course sc);

# 5.Query all SQL with grades
select distinct stu.* from student stu, student_course sc where stu.id = sc.studentId;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select stu.* from student stu, student_course sc
    where stu.id = sc.studentId and sc.courseId = 1 and exists
        (select stu.* from student_course sc2 where stu.id = sc2.studentId and sc2.courseId = 2);

# 7.Retrieve 1 student score with less than 60 scores in descending order
select stu.*, sc.courseId, sc.score from student stu, student_course sc
    where stu.id = sc.studentId and sc.courseId = 1 and score < 60
        order by sc.score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select c.*, avg(sc.score) as average_score from course c, student_course sc
    where c.id = sc.courseId
        group by c.id, c.name, c.teacherId
            order by average_score desc, c.id;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select stu.name, sc.score from student stu, course c, student_course sc
    where stu.id = sc.studentId and c.id = sc.courseId and c.name = 'Math' and sc.score < 60;
