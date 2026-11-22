CREATE TABLE category (
    category_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);
CREATE TABLE nutritions (
    nutrition_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER NOT NULL,
    name TEXT,
    calories REAL,
    fats REAL,
    sugar REAL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY ,
    date_time TEXT NOT NULL,
    address TEXT NOT NULL,
    customer_name TEXT NOT NULL,
    customer_ph TEXT NOT NULL,
    total_price REAL NOT NULL
);
CREATE TABLE products_orders (
    order_id INTEGER,
    product_id INTEGER,
    amount INTEGER NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SELECT
    p.product_id,
    p.name AS product_name,
    p.price,
    c.name AS category_name,
    n.name AS nutrition_name,
    n.calories,
    n.fats,
    n.sugar
FROM products p
LEFT JOIN category c ON p.category_id = c.category_id
LEFT JOIN nutritions n ON p.product_id = n.product_id;

SELECT
*
FROM orders o
LEFT JOIN products_orders po ON o.order_id = po.order_id
LEFT JOIN products p ON po.product_id = p.product_id
LEFT JOIN category c ON p.category_id = c.category_id
ORDER BY o.order_id, p.product_id;
