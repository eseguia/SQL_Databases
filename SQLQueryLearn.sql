-- ALTER TABLE lets you add columns to a table in a database.
ALTER TABLE 
  table_name 
ADD 
  column_name datatype;

-- AND is an operator that combines two conditions. 
-- Both conditions must be true for the row to be included in the result set.
SELECT column_name(s)
FROM table_name
WHERE column_1 = value_1
  AND column_2 = value_2;

-- AS is a keyword in SQL that allows you to rename a column or table using an alias.
SELECT 
  column_name(s) 
FROM 
  table_name 
WHERE 
  column_1 = value_1 
  AND column_2 = value_2;

-- AVG() is an aggregate function that returns the average value for a numeric column.
SELECT 
  AVG(column_name) 
FROM 
  table_name;


  -- The BETWEEN operator is used to filter the result set within a certain range. 
-- The values can be numbers, text or dates.
SELECT 
  column_name(s) 
FROM 
  table_name 
WHERE 
  column_name BETWEEN value_1 
  AND value_2;


  -- CASE statements are used to create different outputs (usually in the SELECT statement). 
-- It is SQL’s way of handling if-then logic.
SELECT column_name,
  CASE
    WHEN condition THEN 'Result_1'
    WHEN condition THEN 'Result_2'
    ELSE 'Result_3'
  END
FROM table_name;


-- COUNT() is a function that takes the name of a column as an argument and 
-- counts the number of rows where the column is not NULL.
SELECT 
  COUNT(column_name) 
FROM 
  table_name;

  -- CREATE TABLE creates a new table in the database. 
-- It allows you to specify the name of the table and the name of each column in the table.
CREATE TABLE table_name (
  column_1 datatype, 
  column_2 datatype, 
  column_3 datatype
);



-- DELETE statements are used to remove rows from a table.
DELETE FROM 
  table_name 
WHERE 
  some_column = some_value;


  -- GROUP BY is a clause in SQL that is only used with aggregate functions. 
-- It is used in collaboration with the SELECT statement to arrange identical data into groups.
SELECT 
  column_name, 
  COUNT(*) 
FROM 
  table_name 
GROUP BY 
  column_name;


  -- HAVING was added to SQL because the WHERE keyword 
-- could not be used with aggregate functions.
SELECT 
  column_name, 
  COUNT(*) 
FROM 
  table_name 
GROUP BY 
  column_name 
HAVING 
  COUNT(*) > value;


  -- An inner JOIN will combine rows from different tables if the join condition is true.
SELECT 
  column_name(s) 
FROM 
  table_1 
  JOIN table_2 ON table_1.column_name = table_2.column_name;



  -- INSERT statements are used to add a new row to a table.
INSERT INTO table_name (column_1, column_2, column_3) 
VALUES 
  (value_1, 'value_2', value_3);



  -- IS NULL and IS NOT NULL are operators used with the WHERE clause to test for empty values.
SELECT 
  column_name(s) 
FROM 
  table_name 
WHERE 
  column_name IS NULL;



  -- LIKE is a special operator used with the WHERE clause to search for 
-- a specific pattern in a column.
SELECT 
  column_name(s) 
FROM 
  table_name 
WHERE 
  column_name LIKE pattern;



  -- LIMIT is a clause that lets you specify
-- the maximum number of rows the result set will have.
SELECT 
  column_name(s) 
FROM 
  table_name 
LIMIT 
  number;



  -- MAX() is a function that takes the name of a column as an argument 
-- and returns the largest value in that column.
SELECT 
  MAX(column_name) 
FROM 
  table_name;



  -- MIN() is a function that takes the name of a column as an argument 
-- and returns the smallest value in that column.
SELECT 
  MIN(column_name) 
FROM 
  table_name;



  -- OR is an operator that filters the result set to only include rows where 
-- either condition is true.
SELECT 
  column_name 
FROM 
  table_name 
WHERE 
  column_name = value_1 
  OR column_name = value_2;



  -- ORDER BY is a clause that indicates you want to sort the result set 
-- by a particular column either alphabetically or numerically.
SELECT 
  column_name 
FROM 
  table_name 
ORDER BY 
  column_name ASC | DESC;



  -- An outer JOIN will combine rows from different tables even if 
-- the join condition is not met. 
-- Every row in the left table is returned in the result set, 
-- and if the join condition is not met, 
-- then NULL values are used to fill in the columns from the right table.
SELECT 
  column_name(s) 
FROM 
  table_1 
  LEFT JOIN table_2 ON table_1.column_name = table_2.column_name;



  -- ROUND() is a function that takes a column name and an integer as arguments.
-- It rounds the values in the column to the number of decimal places specified by 
-- the integer.
SELECT 
  ROUND(column_name, integer) 
FROM 
  table_name;



  -- SELECT statements are used to fetch data from a database. 
-- Every query will begin with SELECT.
SELECT 
  column_name 
FROM 
  table_name;



  -- SELECT DISTINCT specifies that the statement is going to be a query 
-- that returns unique values in the specified column(s).
SELECT 
  DISTINCT column_name 
FROM 
  table_name;



  -- SUM() is a function that takes the name of a column as an argument 
-- and returns the sum of all the values in that column.
SELECT 
  SUM(column_name) 
FROM 
  table_name;



  -- UPDATE statements allow you to edit rows in a table.
UPDATE 
  table_name 
SET 
  some_column = some_value 
WHERE 
  some_column = some_value;




  -- WHERE is a clause that indicates you want to filter the result set to include 
-- only rows where the following condition is true.
SELECT 
  column_name(s) 
FROM 
  table_name 
WHERE 
  column_name operator value;



  -- WITH clause lets you store the result of a query in a temporary table using an alias. 
-- You can also define multiple temporary tables using a comma 
-- and with one instance of the WITH keyword.
-- The WITH clause is also known as common table expression (CTE) and subquery factoring.
WITH temporary_name AS (
  SELECT 
    * 
  FROM 
    table_name
) 
SELECT 
  * 
FROM 
  temporary_name 
WHERE 
  column_name operator value;



  -- LESSON 1 'MANIPULATION'

  -- SELECT statements are used to fetch data from a database.
SELECT 
  * 
FROM 
  celebs;


  -- CREATE statements allow us to create a new table in the database.
CREATE TABLE table_name (
   column_1 data_type, 
   column_2 data_type, 
   column_3 data_type
);


-- CREATE example
CREATE TABLE celebs (
  id INTEGER,
  name TEXT,
  age INTEGER
);



-- The INSERT statement inserts a new row into a table
INSERT INTO celebs (id, name, age) 
VALUES 
  (1, 'Justin Bieber', 22), 
  (2, 'Beyonce Knowles', 33), 
  (3, 'Jeremy Lin', 26), 
  (4, 'Taylor Swift', 26);



  -- The ALTER TABLE statement adds a new column to a table.
ALTER TABLE 
  celebs 
ADD 
  COLUMN twitter_handle TEXT;



  -- The UPDATE statement edits a row in a table. 
UPDATE 
  celebs 
SET 
  twitter_handle = '@taylorswift13' 
WHERE 
  id = 4;



  -- The DELETE FROM statement deletes one or more rows from a table.

-- The statement below deletes all records in the celeb table with no twitter_handle
DELETE FROM 
  celebs 
WHERE 
  twitter_handle IS NULL;

-- To delete only a specific number of rows, you can utilize the LIMIT statement. 
-- The value provided for LIMIT will be how many rows to affect.
DELETE FROM 
  table 
WHERE 
  condition 
LIMIT 
  5;



  -- CONSTRAINTS that add information about how a column can be used 
-- are invoked after specifying the data type for a column.
-- They can be used to tell the database to reject inserted data that does not 
-- adhere to a certain restriction. 
-- The statement below sets constraints on the celebs table.
CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);



-- CONSTRAINTS examples:
-- -- PRIMARY KEY columns can be used to uniquely identify the row. 
--    Attempts to insert a row with an identical value to a row already 
--    in the table will result in a constraint violation which will not allow you 
--    to insert the new row.
--    By using a constraint like the PRIMARY KEY, we can ensure that 
--    every row has their own unique id value.
-- -- UNIQUE columns have a different value for every row. 
--    This is similar to PRIMARY KEY except a table can have many different 
--    UNIQUE columns.
-- -- NOT NULL columns must have a value. 
--    Attempts to insert a row without a value for a NOT NULL column will result in 
--    a constraint violation and the new row will not be inserted.
-- -- DEFAULT columns take an additional argument that will be the assumed value 
--    for an inserted row if the new row does not specify a value for that column.

-- Example
CREATE TABLE awards (
   id INTEGER PRIMARY KEY,
   recipient TEXT NOT NULL,
   award_name TEXT DEFAULT 'Grammy'
);



-- LESSON 2 'QUERIES'

-- SELECT all
SELECT 
  * 
FROM 
  movies;

  -- SELECT specified columns (name, genre, year)
SELECT 
  name, 
  genre, 
  year 
FROM 
  movies;



  -- AS is a keyword in SQL that allows you to rename a column or table using an alias.
-- When using AS, the columns are not being renamed in the table. The aliases only appear in the result.
SELECT 
  imdb_rating as 'IMDb' 
FROM 
  movies;



  -- DISTINCT is used to return unique values in the output. It filters out all duplicate values in the specified column(s).
SELECT 
  DISTINCT genre 
FROM 
  movies;


  -- We can restrict our query results using the WHERE clause in order to obtain only the information we want.
SELECT 
  * 
FROM 
  movies 
WHERE 
  imdb_rating < 5;



  -- LIKE can be a useful operator when you want to compare similar values. 
-- LIKE is a special operator used with the WHERE clause to search for 
-- a specific pattern in a column.
SELECT 
  * 
FROM 
  movies 
WHERE 
  name LIKE 'Se_en';  -- The names Seven and Se7en both match this pattern.

-- The _ means you can substitute any individual character here without breaking 
-- the pattern. 

-- % is a wildcard character that matches zero or more missing letters in the pattern.
-- For example:
-- -- A% matches all movies with names that begin with letter ‘A’
-- -- %a matches all movies that end with ‘a’
-- We can also use % both before and after a pattern:
SELECT 
  * 
FROM 
  movies 
WHERE 
  name LIKE '%man%';

-- LIKE is not case sensitive.



-- Unknown values are indicated by NULL.

-- It is not possible to test for NULL values with comparison operators, 
-- such as = and !=. 
-- Instead, we will have to use these operators:
-- -- IS NULL
-- -- IS NOT NULL
SELECT 
  name 
FROM 
  movies 
WHERE 
  imdb_rating IS NULL;



  -- The BETWEEN operator is used in a WHERE clause to filter the result 
-- set within a certain range. 
-- It accepts two values that are either numbers, text or dates.

-- Using the BETWEEN operator, write a query that selects all information 
-- about movies whose name begins with the letters ‘D’, ‘E’, and ‘F’.
SELECT 
  * 
FROM 
  movies 
WHERE 
  name BETWEEN 'D' 
  AND 'G';

-- Using the BETWEEN operator, write a new query that selects all information 
-- about movies that were released in the 1970’s.
SELECT 
  * 
FROM 
  movies 
WHERE 
  year BETWEEN 1970 
  AND 1979;



  -- With AND, both conditions must be true for the row to be included in the result.

-- let’s retrieve every movie released in the 70’s, that’s also well received. 
SELECT 
  * 
FROM 
  movies 
WHERE 
  year BETWEEN 1990 
  AND 1999 
  AND genre = 'romance';
    
-- we have a picky friend who only wants to watch old horror films.    
SELECT 
  * 
FROM 
  movies 
WHERE 
  year < 1985 
  AND genre = 'horror';



  -- OR operator displays a row if any condition is true.

-- write a query that returns all movies that were released after 2014 or are action movies.
SELECT 
  * 
FROM 
  movies 
WHERE 
  year > 2014 
  OR genre = 'action'

-- write a query that returns all movies that are either a romance or a comedy.
SELECT 
  * 
FROM 
  movies 
WHERE 
  genre = 'romance' 
  OR genre = 'comedy'



  -- Queries can combine multiple conditions using AND and OR without a real limit 
-- to how many conditions you can combine

-- This will select movies with id values 
-- from 10 to 20 inclusive, OR with id 
-- values from 50 to 60 inclusive.
SELECT 
  * 
FROM 
  movies 
WHERE 
  (
    id > 10 
    AND id < 20
  ) 
  OR (
    id > 50 
    AND id < 60
  );



  -- We can sort the results using ORDER BY, either alphabetically or numerically. 

-- ORDER BY always goes after WHERE (if WHERE is present).
SELECT 
  * 
FROM 
  movies 
WHERE 
  imdb_rating > 8 
ORDER BY 
  year DESC;

-- Suppose we want to retrieve the name and year columns of all the movies, 
-- ordered by their name alphabetically.
SELECT 
  name, 
  year 
FROM 
  movies 
GROUP BY 
  name

-- Write a new query that retrieves the name, year, and imdb_rating columns 
-- of all the movies, ordered highest to lowest by their ratings.
SELECT 
  name, 
  year, 
  imdb_rating 
FROM 
  movies 
ORDER BY 
  imdb_rating DESC;

-- ORDER BY with multiple columns
-- Following the ORDER BY, you can list more than one column for which to order the data by.
-- When ordering by more than one column, it will first order the data on the first column,
-- then, keeping the previous column order, it will order on the next column, and so on.




-- LIMIT lets you specify the maximum number of rows the result set will have.
-- LIMIT always goes at the very end of the query.
-- it is not supported in all SQL databases.

-- write a query that returns the top 3 highest rated movies.
SELECT 
  * 
FROM 
  movies 
ORDER BY 
  imdb_rating DESC 
LIMIT 
  3;



  -- A CASE statement allows us to create different outputs 
-- It is SQL’s way of handling if-then logic.

SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'
  WHEN imdb_rating > 6 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END AS 'Review'  -- AS to shorten the name of the new column
FROM movies;



-- Same queries:
-- Option 1:
SELECT name,
 CASE
  WHEN genre = 'romance' THEN 'Chill'
  WHEN genre = 'comedy'  THEN 'Chill'
  ELSE 'Intense'
 END AS 'Mood'
FROM movies;

-- Option 2:
SELECT name,
 CASE
  WHEN genre = 'romance' OR genre = 'comedy' 
   THEN 'Chill'
  ELSE 'Intense'
 END AS 'Mood'
FROM movies;




-- LESSON 3 'AGGREGATE FUNCTIONS'


-- COUNT() is a function that takes the name of a column as an argument and counts 
-- the number of non-empty values in that column.

-- count how many free apps are in the table.
SELECT 
  COUNT(*) 
FROM 
  fake_apps 
WHERE 
  price == 0;



  -- SUM() is a function that takes the name of a column as an argument 
-- and returns the sum of all the values in that column.

-- what is the total number of downloads for all of the apps combined?
SELECT 
  SUM(downloads) 
FROM 
  fake_apps;


  -- MAX() and MIN() functions return the highest and lowest values in a column

-- what is the least number of times an app has been downloaded?
SELECT 
  MIN(downloads) 
FROM 
  fake_apps;

-- How can you make the output show all rows that contain the maximum price, 
-- instead of just top one?
SELECT 
  name, 
  price 
FROM 
  fake_apps 
WHERE 
  price = (
    SELECT 
      MAX(price) 
    FROM 
      fake_apps
  );
-- rather than SELECT-ing rows from the table where the price is exactly some number 
-- we specify, we compare price to the result of another query, 
-- in this case a MAX query.


-- AVG() function to quickly calculate the average value of a particular column.

-- the average number of downloads for an app in our database:
SELECT 
  AVG(downloads) 
FROM 
  fake_apps;

-- get the average of only the unique values of a column:
SELECT 
  AVG(DISTINCT price) 
FROM 
  fake_apps;



  -- ROUND() function takes 2 arguments inside the parenthesis: a column name; an integer.
-- It rounds the values in the column to the number of decimal places specified by 
-- the integer. 

-- return the name column and a rounded price column.
SELECT 
  name, 
  ROUND(price, 0) 
FROM 
  fake_apps;

-- return the avg price of an app rounded up to 2 decimal places
SELECT 
  ROUND(
    AVG(price), 
      2) 
FROM 
  fake_apps;



  -- GROUP BY is a clause in SQL that is used with aggregate functions. 
-- It is used in collaboration with the SELECT statement to arrange identical data 
-- into groups.
-- The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.

-- The result contains the total number of apps for each price.
SELECT 
  price, 
  COUNT(*) 
FROM 
  fake_apps 
GROUP BY 
  price;

-- count the total number of apps that have been downloaded more than 20,000 times, 
-- at each price.
SELECT 
  price, 
  COUNT(*) 
FROM 
  fake_apps 
WHERE 
  downloads > 20000 
GROUP BY 
  price;

-- Write a new query that calculates the total number of downloads for each category.
SELECT 
  category, 
  SUM(downloads) 
FROM 
  fake_apps 
GROUP BY 
  category;



  -- SQL lets us use column reference(s) in our GROUP BY that will make our lives easier.

-- We might want to know how many movies have IMDb ratings that round to 1, 2, 3, 4, 5. 
-- Here, the 1 refers to the first column in our SELECT statement, ROUND(imdb_rating).
SELECT 
  ROUND(imdb_rating), 
  COUNT(name) 
FROM 
  movies 
GROUP BY 
  1 
ORDER BY 
  1;




  -- These are the same:
-- Option 1:
SELECT 
  category, 
  price, 
  AVG(downloads) 
FROM 
  fake_apps 
GROUP BY 
  category, 
  price;

-- Option 2:
SELECT 
  category, 
  price, 
  AVG(downloads) 
FROM 
  fake_apps 
GROUP BY 
  1, 
  2;




  -- HAVING is very similar to WHERE. 
-- In fact, all types of WHERE clauses you learned about thus far 
-- can be used with HAVING.

-- When we want to limit the results of a query based on values of the individual rows, 
-- use WHERE.

-- When we want to limit the results of a query based on an aggregate property, 
-- use HAVING. 

-- HAVING statement always comes after GROUP BY, but before ORDER BY and LIMIT.
SELECT 
  year, 
  genre, 
  COUNT(name) 
FROM 
  movies 
GROUP BY 
  1, 
  2 
HAVING 
  COUNT(name) > 10;

-- Example
-- It returns the average downloads (rounded) and the number of apps at each price point.
-- HAVING clause restricts the query to price points that have more than 10 apps.
SELECT 
  price, 
  ROUND(
    AVG(downloads)
  ), 
  COUNT(*) 
FROM 
  fake_apps 
GROUP BY 
  price 
HAVING 
  COUNT(price) > 10;



  -- This will first filter the movies with a box_office > 500000.
-- Then, it will group those results by genre, and finally restrict
-- the query to genres that have more than 5 movies.
SELECT 
  genre, 
  ROUND(
    AVG(score)
  ) 
FROM 
  movies 
WHERE 
  box_office > 500000 
GROUP BY 
  genre 
HAVING 
  COUNT(*) > 5;



  -- LESSON 4 'MULTIPLE TABLES'


  -- SQL gives us an easy way to combine tables: it’s called a JOIN.
-- When we perform a simple JOIN (often called an inner join) 
-- our result only includes rows that match our ON condition.

-- If we want to combine table_1 and table_2 on customer_id column, we would type:
SELECT 
  * 
FROM 
  table_1 
  JOIN table_2 ON table_1.customer_id = table_2.customer_id;
    
-- Join orders table and subscriptions table and select all columns.
-- Make sure to join on the subscription_id column 
-- where description is equal to ‘Fashion Magazine’..
SELECT 
  * 
FROM 
  orders 
  JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id;
WHERE 
  description = 'Fashion Magazine';

-- count the number of subscribers of both services
SELECT 
  COUNT(*) AS subscribers_of_both 
FROM 
  newspaper 
  JOIN online ON newspaper.id = online.id;



  -- LEFT JOIN will keep all rows from the first table, 
-- regardless of whether there is a matching row in the second table.

-- LEFT JOIN says: “Return all the data from the first table no matter what. 
-- If there are any matches with the second table, provide that information as well, 
-- but if not, just fill the missing data with NULL values.”

-- The final result will keep all rows of the first table 
-- but will omit the un-matched rows from the second table.
SELECT 
  * 
FROM 
  table1 
  LEFT JOIN table2 ON table1.c2 = table2.c2;
    
-- which users do not subscribe to the online edition
-- (add where clause)
SELECT 
  * 
FROM 
  newspaper 
  LEFT JOIN online ON newspaper.id = online.id 
WHERE 
  online.id IS NULL;



  -- PRIMARY KEYS
-- Primary keys are unique identifiers that have following requirements:
-- -- None of the values can be NULL.
-- -- Each value must be unique.
-- -- A table can not have more than one primary key column.



-- FOREIGN KEYS
-- When the primary key for one table appears in a different table, 
-- it is called a foreign key. 

-- For example, an _id is a primary key when it appears in classes, 
-- but it will be a foreign key with a name class_id when it appears in students.
SELECT 
  * 
FROM 
  classes 
  JOIN students ON classes.id = students.class_id;



  -- CROSS JOIN
-- Sometimes, we just want to combine all rows of one table with all rows 
-- of another table. 

-- For instance, if we had a table of shirts and a table of pants, 
-- we might want to know all the possible combinations to create different outfits.
SELECT 
  shirts.shirt_color, 
  pants.pants_color 
FROM 
  shirts CROSS 
  JOIN pants;

-- A more common usage of CROSS JOIN is when we need to compare each row of a table 
-- to a list of values.




-- count the number of customers who were subscribed to the newspaper during March. 
-- “During March” means that the customer’s starting month was in or before March 
-- and final month was in or after March:
SELECT 
  COUNT(*) 
FROM 
  newspaper 
WHERE 
  start_month <= 3 
  AND end_month >= 3;



  -- Create a final query where you aggregate over each month 
-- to count the number of subscribers.
SELECT 
  month, 
  COUNT(*) 
FROM 
  newspaper CROSS 
  JOIN months 
WHERE 
  start_month <= month 
  AND end_month >= month 
GROUP BY 
  month;



  -- You can CROSS JOIN as many tables as you want.
-- Example
SELECT 
  shirts.shirt_color, 
  pants.pants_color, 
  socks.sock_color 
FROM 
  shirts CROSS 
  JOIN pants CROSS 
  JOIN socks;



  -- Sometimes we just want to stack one dataset on top of the other. The UNION operator
-- allows us to do that.
-- When you combine tables with UNION, duplicate rows will be excluded.

-- SQL has strict rules for appending data:
-- -- Tables must have the same number of columns.
-- -- The columns must have the same data types in the same order as the first table.

-- We’d like to create one big table with both sets of data. 
SELECT 
  * 
FROM 
  table1 
UNION 
SELECT 
  * 
FROM 
  table2;




  -- The WITH statement allows us to perform a separate query 
-- (such as aggregating customer’s subscriptions)
-- previous_results is the alias that we will use to reference any columns 
-- from the query inside of the WITH clause
-- We can then go on to do whatever we want with this temporary table 
-- (such as join the temporary table with another table)
WITH previous_results AS (
   SELECT 
   ...
   ...
   ...
   ...
)
SELECT 
  * 
FROM 
  previous_results 
  JOIN customers ON _____ = _____;

-- Thus, we are putting a whole first query inside the parentheses () 
-- and giving it a name. After that, we can use this name as if it’s a table 
-- and write a new query using the first query.




-- EXAMPLE
WITH previous_query AS (
  SELECT 
    customer_id, 
    COUNT(subscription_id) AS 'subscriptions' 
  FROM 
    orders 
  GROUP BY 
    customer_id
) 
SELECT 
  customers.customer_name, 
  previous_query.subscriptions 
FROM 
  previous_query 
  JOIN customers ON previous_query.customer_id = customers.customer_id;




  -- You can use WITH for more than one nested query. 
-- You can do so by listing each query using commas after the WITH.
WITH
query1 AS (SELECT column1 FROM table1 WHERE condition1),
query2 AS (SELECT column2 FROM table2 WHERE condition2)
…


-- LESSON 1 REVIEW:
-- -- CREATE TABLE creates a new table.
-- -- INSERT INTO adds a new row to a table.
-- -- SELECT queries data from a table.
-- -- ALTER TABLE changes an existing table.
-- -- UPDATE edits a row in a table.
-- -- DELETE FROM deletes rows from a table.
-- LESSON 2 REVIEW:
-- -- SELECT is the clause we use every time we want to query information from a database.
-- -- AS renames a column or table.
-- -- DISTINCT return unique values.
-- -- WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
-- -- LIKE and BETWEEN are special operators.
-- -- AND and OR combines multiple conditions.
-- -- ORDER BY sorts the result.
-- -- LIMIT specifies the maximum number of rows that the query will return.
-- -- CASE creates different outputs.

-- LESSON 3 REVIEW:
-- -- COUNT(): count the number of rows
-- -- SUM(): the sum of the values in a column
-- -- MAX()/MIN(): the largest/smallest value
-- -- AVG(): the average of the values in a column
-- -- ROUND(): round the values in the column

-- Aggregate functions combine multiple rows together to form a single value
-- of more meaningful information:
-- -- GROUP BY is a clause used with aggregate functions to combine data 
--    from one or more columns.
-- -- HAVING limit the results of a query based on an aggregate property.


-- LESSON 4 REVIEW:
-- -- JOIN will combine rows from different tables if the join condition is true.
-- -- LEFT JOIN will return every row in the left table, 
--    and if the join condition is not met, NULL values are used to fill in the columns 
--    from the right table.
-- -- Primary key is a column that serves a unique identifier for the rows in the table.
-- -- Foreign key is a column that contains the primary key to another table.
-- -- CROSS JOIN lets us combine all rows of one table with all rows of another table.
-- -- UNION stacks one dataset on top of another.
-- -- WITH allows us to define one or more temporary tables that can be used 
--    in the final query.