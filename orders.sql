SELECT * FROM store.orders WHERE shipped_date IS NULL;

-- multiple join table
USE store;
SELECT * FROM orders o 
		JOIN customers c
			ON o.customer_id = c.customer_id
        JOIN order_statuses os
            ON o.status = os.order_status_id;
            
 
-- implicit join

SELECT * FROM orders o, customers c WHERE o.customer_id = c.customer_id ORDER BY o.customer_id ASC;

-- left join
SELECT * 
FROM orders o
LEFT JOIN customers c
      ON o.customer_id = c.customer_id;
      
-- right join
SELECT * 
FROM orders o
RIGHT JOIN customers c
      ON o.customer_id = c.customer_id;      

-- using USING 
SELECT * FROM orders  JOIN customers USING(customer_id);        

-- using UNION
SELECT order_id,order_date, 'ACTIVE' AS status FROM orders WHERE order_date >= '2019-01-01'
UNION
SELECT order_id,order_date, 'ARCHIVE' AS status FROM orders WHERE order_date <= '2019-01-01';

-- inserting hierarchical data in mySQL

INSERT INTO orders (customer_id,order_date)
VALUES ('11','21-01-02');
INSERT INTO order_items
VALUES (LAST_INSERT_ID(),1,1,2.95),
       (LAST_INSERT_ID(),2,1,2.95);

-- creating a copy of a table

CREATE TABLE order_archive 
SELECT * FROM orders;

-- using sub query select statement into insert statement after truncating a table

INSERT INTO order_archive
SELECT *
FROM orders
WHERE order_date <= '2020-01-01';


