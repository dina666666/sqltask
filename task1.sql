CREATE TABLE Governorates (
    governorate_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    governorate_id INT,
    FOREIGN KEY (governorate_id) REFERENCES Governorates(governorate_id)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(100),
    brief_data TEXT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE store_products (
    store_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    credit_limit DECIMAL(10, 2), 
    country VARCHAR(50)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10, 2),      
    payment_date DATE,           
    customer_id INT,              
    payment_method VARCHAR(50),  
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);

CREATE TABLE orderdetails (
    order_number INT,
    product_code VARCHAR(20),
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_number, product_code),
    FOREIGN KEY (order_number) REFERENCES orders(order_number), 
    FOREIGN KEY (product_code) REFERENCES products(product_code)  
);

