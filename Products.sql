SELECT * FROM store.products;

SELECT name,unit_price, (unit_price*1.1) AS new_price FROM store.products;


SELECT * FROM store.products WHERE quantity_in_stock IN ('49','38','72');

SELECT * FROM store.products WHERE order_id = 2;

SELECT *, quantity_in_stock * unit_price AS total_price  FROM store.products ORDER BY total_price DESC;

SELECT order_id, p.product_id, quantity, p.unit_price 
                                  FROM products p 
                                  JOIN order_items o
								  ON p.product_id = o.product_id;
                                  
                                  
								  


