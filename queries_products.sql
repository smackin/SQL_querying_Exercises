-- Comments in SQL Start with dash-dash --
--Add a product to the table with the name of “chair”, price of 44.00, and can_be_returned of false
products_db=# INSERT INTO products (name, price, can_be_returned)  VALUES ('chair', '44.00', false); 
INSERT 0 1
products_db=# SELECT * FROM products;                                            
id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
(1 row)

--Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.
products_db=# INSERT INTO products (name, price, can_be_returned)  
             VALUES ('stool', 25.99, true);
INSERT 0 1
products_db=# SELECT * FROM products;                                            
id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
(2 rows)

-- Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false.
products_db=# INSERT INTO products (name, price, can_be_returned)               
VALUES ('table', 124.00, false);                                               
INSERT 0 1
products_db=# SELECT * FROM products;                                            
id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f
(3 rows) 

--Display all of the rows and columns in the table.
products_db=# SELECT * FROM products;                                            
id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f
(3 rows)

--Display all of the names of the products
products_db=# SELECT name FROM products;
 name  
-------
 chair
 stool
 table
(3 rows)

--Display all of the names and prices of the products.
products_db=# SELECT name,price FROM products;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)

--Add a new product - make up whatever you would like!
products_db=# SELECT * FROM products;
 id |   name   | price | can_be_returned 
----+----------+-------+-----------------
  1 | chair    |    44 | f
  2 | stool    | 25.99 | t
  3 | table    |   124 | f
  4 | bookcase | 89.99 | t
(4 rows)

-- Display only the products that can_be_returned.
products_db=# SELECT * FROM products
products_db-# WHERE can_be_returned;
 id |   name   | price | can_be_returned 
----+----------+-------+-----------------
  2 | stool    | 25.99 | t
  4 | bookcase | 89.99 | t
(2 rows)

--Display only the products that have a price less than 44.00.
products_db=# SELECT * FROM products 
products_db-# WHERE price < 44.00; 
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  2 | stool | 25.99 | t
(1 row)

--Display only the products that have a price in between 22.50 and 99.99.

products_db=# SELECT * FROM products
products_db-# WHERE price > 22.50
products_db-# AND price < 99 ;
 id |   name   | price | can_be_returned 
----+----------+-------+-----------------
  1 | chair    |    44 | f
  2 | stool    | 25.99 | t
  4 | bookcase | 89.99 | t
(3 rows)

--There’s a sale going on: Everything is $20 off! Update the database accordingly.
products_db=# UPDATE products SET price = price - 20;
UPDATE 4
products_db=# SELECT * FROM products
products_db-# ;
 id |   name   |       price       | can_be_returned 
----+----------+-------------------+-----------------
  1 | chair    |                24 | f
  2 | stool    | 5.989999999999998 | t
  3 | table    |               104 | f
  4 | bookcase |             69.99 | t
(4 rows)

--Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.

products_db=# DELETE FROM products WHERE price < 25; 
DELETE 2
products_db=# SELECT * FROM products                                            ;
 id |   name   | price | can_be_returned 
----+----------+-------+-----------------
  3 | table    |   104 | f
  4 | bookcase | 69.99 | t
(2 rows)

--And now the sale is over. For the remaining products, increase their price by $20.

products_db=# UPDATE products SET price = price + 20; 
UPDATE 2
products_db=# SELECT * FROM products                                            ;
 id |   name   | price | can_be_returned 
----+----------+-------+-----------------
  3 | table    |   124 | f
  4 | bookcase | 89.99 | t
(2 rows)

-- There's been a change in company policy, and now all products are returnable

products_db=# UPDATE products SET can_be_returned = 't'; 
UPDATE 2
products_db=# SELECT * FROM products                                            ;
 id |   name   | price | can_be_returned 
----+----------+-------+-----------------
  3 | table    |   124 | t
  4 | bookcase | 89.99 | t
(2 rows)

products_db=# 