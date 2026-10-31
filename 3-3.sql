USE test_db;

-- 1. Tạo bảng orders2 (Đơn hàng)
CREATE TABLE IF NOT EXISTS orders2 (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- 2. Tạo bảng products2 (Sản phẩm)
CREATE TABLE IF NOT EXISTS products2 (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- 3. Tạo bảng trung gian order_items1
CREATE TABLE IF NOT EXISTS order_items1 (
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders2(order_id),
    FOREIGN KEY (product_id) REFERENCES products2(product_id),
    CONSTRAINT chk_quantity CHECK (quantity > 0)
);