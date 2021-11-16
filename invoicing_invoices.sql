SELECT * FROM invoicing.invoices;

-- creating a copy of a table and using sub queries

USE invoicing;
CREATE TABLE invoices_archive
SELECT * FROM invoices;

CREATE TABLE invoices_archive_again AS
SELECT * FROM invoices_archive JOIN clients USING(client_id) WHERE payment_date IS NOT NULL;

-- updating a single row
UPDATE invoices
SET payment_total = 10 , payment_date = '2021-01-01'
WHERE invoice_id = 1; -- condition

