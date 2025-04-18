-- Create branches table
CREATE TABLE branches (
    branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(100),
    location VARCHAR(100)
);

-- Create products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);

-- Create suppliers table
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    delivery_delay_avg INT
);

-- Create inventory table
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branches(branch_id),
    product_id INT REFERENCES products(product_id),
    stock_quantity INT,
    month DATE
);

-- Create deliveries table
CREATE TABLE deliveries (
    delivery_id SERIAL PRIMARY KEY,
    supplier_id INT REFERENCES suppliers(supplier_id),
    product_id INT REFERENCES products(product_id),
    delivery_date DATE,
    quantity_delivered INT
);

-- Create sales table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branches(branch_id),
    product_id INT REFERENCES products(product_id),
    sale_date DATE,
    quantity_sold INT
);
