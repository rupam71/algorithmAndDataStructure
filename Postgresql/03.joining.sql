-- PostgreSQL supports inner join, left join, right join, full outer join, cross join, natural join, and a special kind of join called self-join.
-- Using table aliases
SELECT
  c.customer_id,
  c.first_name,
  p.amount,
  p.payment_date
FROM
  customer c
  INNER JOIN payment p ON p.customer_id = c.customer_id
ORDER BY
  p.payment_date DESC;

-- Inner join 3 table
SELECT
  c.customer_id,
  c.first_name || ' ' || c.last_name customer_name,
  s.first_name || ' ' || s.last_name staff_name,
  p.amount,
  p.payment_date
FROM
  customer c
  INNER JOIN payment p USING (customer_id)
  INNER JOIN staff s using(staff_id)
ORDER BY
  payment_date;

-- Using PostgreSQL LEFT JOIN with WHERE clause
SELECT
  f.film_id,
  f.title,
  i.inventory_id
FROM
  film f
  LEFT JOIN inventory i USING (film_id)
WHERE
  i.film_id IS NULL
ORDER BY
  f.title;

-- right join
SELECT
  f.film_id,
  f.title,
  i.inventory_id
FROM
  inventory i
  RIGHT JOIN film f USING(film_id)
WHERE
  i.inventory_id IS NULL
ORDER BY
  f.title;

-- self join
SELECT
  e.first_name || ' ' || e.last_name employee,
  m.first_name || ' ' || m.last_name manager
FROM
  employee e
  INNER JOIN employee m ON m.employee_id = e.manager_id
ORDER BY
  manager;

-- full outer join
SELECT
  employee_name,
  department_name
FROM
  employees e 
  FULL OUTER JOIN departments d ON d.department_id = e.department_id
WHERE
  employee_name IS NULL;

-- cross join make m*n column. all column in both tasble.
-- Use the PostgreSQL NATURAL JOIN clause to query data from two or more tables that have common columns.
-- A natural join can be an inner join, left join, or right join. If you do not specify an explicit join, PostgreSQL will use the INNER JOIN by default.
SELECT
  *
FROM
  products 
  NATURAL JOIN categories;