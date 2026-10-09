DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_categories;

create table product_categories (
  id INT IDENTITY(1,1) PRIMARY KEY,
  category_name VARCHAR(31) NOT NULL
);

create table products (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nome_produto VARCHAR(63) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES product_categories(id) ON DELETE CASCADE
);

create table product_images (
  product_id INT NOT NULL,
  img_url VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
