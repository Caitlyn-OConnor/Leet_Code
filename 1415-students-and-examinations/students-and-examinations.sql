select
    s.student_id
    ,s.student_name
    ,sub.subject_name
    ,count(e.student_id) attended_exams
from students s
CROSS JOIN
subjects sub
left join examinations e
    on e.student_id = s.student_id and e.subject_name = sub.subject_name
group by s.student_id, s.student_name, sub.subject_name