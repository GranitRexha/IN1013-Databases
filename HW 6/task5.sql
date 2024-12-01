-- 1
SELECT S.first_name, S.surname, B.bill_date, COUNT(B.bill_no) AS num_bills
FROM restStaff S
JOIN restBill B ON S.staff_no = B.waiter_no
GROUP BY S.first_name, S.surname, B.bill_date
HAVING COUNT(B.bill_no) >= 2;

-- 2
SELECT R.room_name, COUNT(T.table_no) AS num_large_tables
FROM restRest_table T
JOIN restRoom_management R ON T.room_name = R.room_name
WHERE T.no_of_seats > 6
GROUP BY R.room_name;

-- 3
SELECT R.room_name, SUM(B.bill_total) AS total_bills
FROM restRoom_management R
JOIN restBill B ON R.room_name = B.table_no
GROUP BY R.room_name;

-- 4
SELECT H.first_name, H.surname, SUM(B.bill_total) AS total_bill_amount
FROM restStaff H
JOIN restStaff W ON H.staff_no = W.headwaiter
JOIN restBill B ON W.staff_no = B.waiter_no
GROUP BY H.first_name, H.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT B.cust_name
FROM restBill B
GROUP BY B.cust_name
HAVING AVG(B.bill_total) > 400;

-- 6
SELECT S.first_name, S.surname, COUNT(B.bill_no) AS num_bills
FROM restStaff S
JOIN restBill B ON S.staff_no = B.waiter_no
GROUP BY S.first_name, S.surname
HAVING COUNT(B.bill_no) >= 3;