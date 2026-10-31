USE test_db;

-- 1. Tạo bảng classes (Lớp học)
CREATE TABLE class1 (
    class_id VARCHAR(20) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL
);

-- 2. Tạo bảng students (Sinh viên)
CREATE TABLE students1 (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    class_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class1(class_id)
);