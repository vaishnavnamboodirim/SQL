SELECT * FROM store.order_items;
SELECT *
FROM store.order_items
             WHERE (order_id = '6' AND unit_price * quantity  > '30' );
             
             