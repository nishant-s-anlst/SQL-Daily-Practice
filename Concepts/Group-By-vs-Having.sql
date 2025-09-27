-- Write a query to find cities where not even a single order was returned.

--Sample table
create table namaste_orders (
order_id int,
city varchar(10),
sales int );

create table namaste_returns (
order_id int,
return_reason varchar(20) );

insert into namaste_orders values(1, 'Mysore' , 100),(2, 'Mysore' , 200),(3, 'Bangalore' , 250),(4, 'Bangalore' , 150)
,(5, 'Mumbai' , 300),(6, 'Mumbai' , 500),(7, 'Mumbai' , 800);

insert into namaste_returns values
(3,'wrong item'),(6,'bad quality'),(7,'wrong item');

--SOLUTION (HAVING filters grouped data after grouping)
SELECT city FROM orders o
LEFT JOIN returns r
ON o.order_id=r.Order_Id
GROUP BY city
HAVING COUNT(r.Return_Reason)=0 ;




