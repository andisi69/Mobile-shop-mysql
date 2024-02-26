-- 1. Gjetja e users qe email ju perfundon me @live.com.
SELECT * FROM users
WHERE email LIKE '%@live.com';

-- 2. Numerimi i menyres se pagesave nga klientet.
SELECT payment_method, COUNT(payment_method) FROM orders
GROUP BY payment_method;

-- 3. Selectimi i produkteve ne baze te tipit te media.
SELECT COUNT(*) FROM media
WHERE type like 'photo';

-- 4. Numerimi i produkteve qe jane ne kategorine Tablet.
SELECT COUNT(*) FROM products
INNER JOIN product_category ON products.id = product_category.product_id
INNER JOIN categories ON product_category.category_id = categories.id
WHERE categories.name like 'tablet';

-- 5. Numri i userave te cilet kane lene reviews per produktet.
SELECT COUNT(*) FROM users
INNER JOIN reviews ON users.id = reviews.user_id
WHERE users.email like '%gmail.com';

-- 6. Selektimi i produkteve te cilat id nuk e kane NULL.
SELECT * FROM products
LEFT JOIN media ON products.id = media.product_id
WHERE media.product_id IS NOT NULL;

-- 7. Selektimi i produkteve ne bazen te kohes kur jane krijuar,  me nje kohezgjatje prej 3 muajsh.
SELECT * FROM products
WHERE created_at between '2023-01-01' AND '2023-03-31';

-- 8. Grupimi dhe numerimi i produkteve ne baze te emrit.
SELECT name , COUNT(name) FROM media
GROUP BY name;

-- 9. Selektimi i user-it i cili ka rolin ADMIN.
SELECT * FROM users
INNER JOIN user_role ON users.id = user_role.user_id
INNER JOIN roles ON user_role.role_id = roles.id
WHERE roles.name = 'admin';

-- 10. Selektimi i produkteve qe e kane qty me te madhe se mesatarja e qty se produkteve.
SELECT * FROM products
WHERE qty > (SELECT AVG(qty) from products);