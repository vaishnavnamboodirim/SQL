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
                             
                             