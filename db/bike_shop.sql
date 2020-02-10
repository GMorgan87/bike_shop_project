DROP TABLE stock;
DROP TABLE products;
DROP TABLE manufacturers;
DROP TABLE categories;

CREATE TABLE manufacturers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  contact_details TEXT,
  logo_url TEXT
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  buy_cost INT,
  sell_price INT,
  manufacturer_id INT REFERENCES manufacturers(id),
  category_id INT REFERENCES categories(id)
);

CREATE TABLE stock (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id) ON DELETE CASCADE,
  quantity INT
);
