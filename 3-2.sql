USE test_db;

-- 1. Bảng độc giả
CREATE TABLE readers (
    reader_id VARCHAR(20) PRIMARY KEY,
    reader_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

-- 2. Bảng sách
CREATE TABLE books (
    book_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100)
);

-- 3. Bảng trung gian mượn trả
-- (Tạm thời để borrow_date chưa có NOT NULL để thực hành lệnh ALTER TABLE)
CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    reader_id VARCHAR(20) NOT NULL,
    book_id VARCHAR(20) NOT NULL,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (reader_id) REFERENCES readers(reader_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


ALTER TABLE borrowings 
MODIFY COLUMN borrow_date DATE NOT NULL;