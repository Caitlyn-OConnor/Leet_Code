WITH CTE AS (
    SELECT * 
    FROM PRODUCTS
    WHERE CHANGE_DATE <= '2019-08-16'
),
CTE2 AS (
    SELECT 
        PRODUCT_ID,
        MAX(CHANGE_DATE) AS CHANGE_DATE
    FROM CTE
    GROUP BY PRODUCT_ID
)

, Product_LU as 
(SELECT DISTINCT Product_Id FROM Products)
, CTE3 as (
SELECT LU.product_id,CHANGE_DATE
FROM PRODUCT_LU as LU
Left join CTE2 
on 
LU.product_id= CTE2.Product_ID
)

SELECT CTE3.product_Id, coalesce(new_price,10) as price
FROM CTE3 

LEFT JOIN products as p 

ON 

CTE3.product_id = p.product_id
and 

CTE3.change_date = p.change_date
