
-- ==========================================
-- FOOD DELIVERY MANAGEMENT SYSTEM
-- ==========================================


CREATE DATABASE FoodDelivery;
USE FoodDelivery;


-- ==========================================
-- 1. CREATE TABLES
-- ==========================================

-- CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(20),
    address VARCHAR(40),
    phone_no BIGINT,
    email_id VARCHAR(50)
);


-- DELIVERY PARTNERS TABLE
CREATE TABLE delivery_partners (
    partner_id VARCHAR(10) PRIMARY KEY,
    partner_name VARCHAR(20),
    phone_no BIGINT,
    rating INT
);


-- HOTEL DETAILS TABLE
CREATE TABLE hotel_details (
    hotel_id VARCHAR(10) PRIMARY KEY,
    hotel_name VARCHAR(20),
    hotel_type VARCHAR(20),
    rating INT
);


-- ORDERS TABLE
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    hotel_id VARCHAR(10),
    partner_id VARCHAR(10),
    order_date DATE,
    order_amount INT,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (hotel_id)
        REFERENCES hotel_details(hotel_id),

    FOREIGN KEY (partner_id)
        REFERENCES delivery_partners(partner_id)
);


-- ==========================================
-- 2. INSERT DATA
-- ==========================================

-- CUSTOMERS
INSERT INTO customers VALUES
('C101', 'Rahul', 'Kolkata', 9876543210, 'rahul@gmail.com'),
('C102', 'Priya', 'Howrah', 9876543211, 'priya@gmail.com'),
('C103', 'Amit', 'Durgapur', 9876543212, 'amit@gmail.com'),
('C104', 'Sneha', 'Burdwan', 9876543213, 'sneha@gmail.com'),
('C105', 'Arjun', 'Delhi', 9876543214, 'arjun@gmail.com');


-- DELIVERY PARTNERS
INSERT INTO delivery_partners VALUES
('P101', 'Suman', 9876543215, 4),
('P102', 'Rakesh', 9876543216, 5),
('P103', 'Anita', 9876543217, 3),
('P104', 'Neha', 9876543218, 4);


-- HOTEL DETAILS
INSERT INTO hotel_details VALUES
('H101', 'Food Palace', 'Indian', 5),
('H102', 'Pizza Hub', 'Italian', 4),
('H103', 'Spicy Kitchen', 'Chinese', 4),
('H104', 'Burger House', 'Fast Food', 3),
('H105', 'Royal Biryani', 'Indian', 5);


-- ORDERS
INSERT INTO orders VALUES
('O101', 'C101', 'H101', 'P101', '2019-07-14', 500),
('O102', 'C102', 'H102', 'P102', '2019-07-14', 700),
('O103', 'C103', 'H101', 'P103', '2019-07-14', 400),
('O104', 'C104', 'H103', 'P104', '2019-07-15', 600),
('O105', 'C105', 'H104', 'P101', '2019-06-14', 300),
('O106', 'C101', 'H105', 'P102', '2019-07-20', 800),
('O107', 'C102', 'H102', 'P103', '2019-08-14', 450),
('O108', 'C103', 'H103', 'P104', '2019-07-14', 550);


-- ==========================================
-- 3. Q12
-- DISPLAY DISTINCT HOTEL ID, HOTEL NAME
-- AND RATING OF HOTELS WHICH HAVE ORDERS
-- IN JULY 2019
-- ==========================================

select distinct  h.hotel_id, h.hotel_name, h.rating
from hotel_details as h join orders o
on h.hotel_id = o.hotel_id
where MONTH(o.order_date) = 7
order by hotel_id;




SELECT DISTINCT
    h.hotel_id,
    h.hotel_name,
    h.rating
FROM hotel_details h
JOIN orders o
    ON h.hotel_id = o.hotel_id
WHERE o.order_date BETWEEN '2019-07-01'
                       AND '2019-07-31'
ORDER BY h.hotel_id ASC;




-- ==========================================
-- 4. CHECK TABLES
-- ==========================================
