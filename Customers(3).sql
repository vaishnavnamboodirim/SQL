USE store;
SELECT *
FROM customers
-- WHERE customer_id = 1;
ORDER BY first_name;

SELECT first_name, last_name FROM customers;

SELECT
 first_name,
 last_name,
 points,
 points*10+100 AS 'discount factor'
 FROM customers;
 
SELECT * FROM customers WHERE points > 300;

SELECT * FROM customers WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA';

SELECT * FROM customers WHERE birth_date > '1990-01-01' OR 
                             (points > 1000 AND state = 'VA');
SELECT * FROM store.customers;
SELECT * FROM customers WHERE NOT (birth_date > '1990-01-01' OR 
                             (points > 1000 AND state = 'VA'));     
                            
SELECT * FROM store.orders 
         JOIN customers ON orders.customer_id = customers.customer_id;              
         
SELECT order_id, orders.customer_id, first_name, last_name FROM store.orders 
         JOIN customers ON orders.customer_id = customers.customer_id;     
         
-- alias         

SELECT order_id, o.customer_id, first_name, last_name FROM orders o
         JOIN customers c
         ON o.customer_id = c.customer_id;  
                             
                             
                             
 
SELECT * FROM customers;
SELECT * FROM customers WHERE NOT (birth_date > '1990-01-01' OR 
                             (points > 1000 AND state = 'VA'));
                             
SELECT * FROM customers WHERE state = 'VA' OR state = 'GA' OR state = 'FL';			

SELECT * FROM customers WHERE state IN ('VA','GA','FL')	;		
SELECT * FROM customers WHERE state NOT IN ('VA','GA','FL')	;	

SELECT * FROM customers WHERE birth_date BETWEEN '1990-1-1' AND '2000-1-1';

SELECT * FROM customers WHERE (address LIKE '%TRAIL' OR address LIKE '%AVENUE%') OR (phone LIKE '%9');

SELECT * FROM customers WHERE last_name REGEXP '^Dow|mga|field$';
SELECT * FROM customers WHERE last_name REGEXP '[gim]e' OR last_name REGEXP 'e[gim]' OR last_name REGEXP '[a-f]e';
SELECT * FROM customers WHERE first_name REGEXP 'ELKA' OR first_name REGEXP 'AMBUR';
SELECT * FROM customers WHERE last_name REGEXP 'EY$|ON$';     
SELECT * FROM customers WHERE last_name REGEXP '^MY|ON';  
SELECT * FROM customers WHERE last_name REGEXP 'b[ru]';        

SELECT * FROM customers WHERE last_name IS NOT NULL;      

SELECT * FROM customers ORDER BY points DESC LIMIT 3;           

SELECT customer_id, first_name, points, 'Bronze' AS type FROM customers WHERE points <= '2000'
UNION
SELECT customer_id, first_name, points, 'Silver' AS type FROM customers WHERE points > '2000' AND points < '3000'
UNION
SELECT customer_id, first_name, points, 'Gold' AS type FROM customers WHERE points >= '3000'
ORDER BY first_name ASC;

-- inserting a single row 

INSERT INTO customers
VALUES (DEFAULT,'Smith','John','2001-01-01',NULL,'address','City','VA',DEFAULT);

INSERT INTO customers(customer_id,first_name,last_name,birth_date,phone,address,city,state,points)
VALUES (DEFAULT,'Smith','John','2001-01-01',NULL,'address','City','VA',DEFAULT);

INSERT INTO customers(first_name,last_name,birth_date,address,city,state)
VALUES ('Smith','John','2001-01-01','address','City','VA');
        
-- inserting multiple rows
INSERT INTO customers(first_name,last_name,address,city,state)
VALUES ('Smith','Vox','address','city','CA'),  ('Smith','Vox','address','city','CA'), ('Smith','Vox','address','city','CA');

-- updating multiple rows
USE store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';


-- using sub queries to update 
USE store;
UPDATE customers
SET points = points + 50
WHERE customer_id = (SELECT customer_id
                    FROM orders
                    WHERE order_id = 4 );
 
 -- update comments column in order table for customers who have more than 3000 points.
UPDATE orders
SET comments = 'Gold customers'
WHERE customer_id IN (SELECT customer_id
                    FROM customers
                    WHERE  points > 3000 );    

-- deleting rows
DELETE FROM customers
WHERE customer_id = (SELECT customer_id
                    FROM orders
                    WHERE order_id = 4 );     
                    
                    
                    
                    
                    
                    
                    


                       
                             