select *
from Users
where
    PATINDEX('[A-Za-z]%', mail) = 1 
    and  right(mail, 13) COLLATE Latin1_General_BIN ='@leetcode.com'
    and  PATINDEX('%[^A-Za-z0-9_.@-]%', mail) = 0
    and CHARINDEX('@', mail) = LEN(mail) - LEN('@leetcode.com') + 1

