USE test_db;

-- 1. Tạo bảng teachers2 (Giảng viên)
CREATE TABLE IF NOT EXISTS teachers2 (
    teacher_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Tạo bảng courses2 (Khóa học)
CREATE TABLE IF NOT EXISTS courses2 (
    course_id VARCHAR(20) PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    teacher_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers2(teacher_id)
);

-- 3. Tạo bảng students2 (Học viên)
CREATE TABLE IF NOT EXISTS students2 (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Tạo bảng trung gian enrollments (Đăng ký học)
CREATE TABLE enrollments (
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students2(student_id),
    FOREIGN KEY (course_id) REFERENCES courses2(course_id)
);

ALTER TABLE courses
ADD CONSTRAINT chk_course_price CHECK (price > 0);

DROP TABLE IF EXISTS enrollments;