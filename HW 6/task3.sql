-- 1
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
JOIN restBill B ON S.staff_no = B.waiter_no
WHERE B.cust_name = 'Tanya Singh';

-- 2
SELECT R.room_date
FROM restRoom_management R
JOIN restStaff S ON R.headwaiter = S.staff_no
WHERE S.first_name = 'Charles' AND R.room_name = 'Green' AND R.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
JOIN restStaff Z ON S.headwaiter = Z.headwaiter
WHERE Z.first_name = 'Zoe' AND Z.surname = 'Ball' AND S.staff_no != Z.staff_no;

-- 4
SELECT B.cust_name, B.bill_total, S.first_name || ' ' || S.surname AS waiter_name
FROM restBill B
JOIN restStaff S ON B.waiter_no = S.staff_no
ORDER BY B.bill_total DESC;

-- 5
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no IN (
    SELECT waiter_no FROM restBill WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
JOIN restRoom_management RM ON S.staff_no = RM.headwaiter OR S.headwaiter = RM.headwaiter
WHERE RM.room_name = 'Blue' AND RM.room_date = 160312;