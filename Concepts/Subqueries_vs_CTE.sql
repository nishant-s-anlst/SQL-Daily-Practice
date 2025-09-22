-- Find companies that have at least 2 users who speak both English and German.

-- Sample table
CREATE TABLE company_users 
(
company_id int,
user_id int,
language varchar(20)
);

INSERT INTO company_users VALUES
 (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');

--SOLUTION
SELECT company_id 
FROM company_users
WHERE user_id IN (
    SELECT user_id 
    FROM company_users
    WHERE language IN ('English','German')
    GROUP BY user_id
    HAVING COUNT(DISTINCT language) = 2
)
GROUP BY company_id
HAVING COUNT(DISTINCT user_id) >= 2;



