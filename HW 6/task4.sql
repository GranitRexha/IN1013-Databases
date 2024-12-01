-- 1
SELECT DISTINCT B.cust_name
FROM restBill B
JOIN restRoom_management R ON B.table_no = R.room_name
JOIN restStaff S ON R.headwaiter = S.staff_no
WHERE B.bill_total > 450.00 AND S.first_name = 'Charles';

-- 2
SELECT S.first_name, S.surname
FROM restRoom_management R
JOIN restStaff S ON R.headwaiter = S.staff_no
WHERE R.room_date = 160111 AND EXISTS (
    SELECT 1 FROM restBill B WHERE B.bill_date = 160111 AND B.cust_name = 'Nerida'
);

-- 3
SELECT B.cust_name
FROM restBill B
WHERE B.bill_total = (
    SELECT MIN(bill_total) FROM restBill
);

-- 4
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no NOT IN (
    SELECT DISTINCT waiter_no FROM restBill
);

-- 5
SELECT B.cust_name, S.first_name AS headwaiter_firstname, S.surname AS headwaiter_surname, R.room_name
FROM restBill B
JOIN restRoom_management R ON B.table_no = R.room_name
JOIN restStaff S ON R.headwaiter = S.staff_no
WHERE B.bill_total = (SELECT MAX(bill_total) FROM restBill);