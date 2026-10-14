CREATE TABLE insurance_claims (
    claim_id INTEGER PRIMARY KEY,
    policy_id TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    claim_date TEXT NOT NULL,
    policy_type TEXT NOT NULL,
    requested_amount REAL NOT NULL,
    approved_amount REAL,
    status TEXT NOT NULL
);


INSERT INTO insurance_claims VALUES
(1001,'P1001','C001','2026-01-05','Health',85000,80000,'Approved'),
(1002,'P1002','C002','2026-01-08','Motor',125000,110000,'Approved'),
(1003,'P1003','C003','2026-01-12','Life',200000,NULL,'Pending'),
(1004,'P1004','C004','2026-01-15','Travel',45000,40000,'Approved'),
(1005,'P1005','C005','2026-01-18','Property',175000,NULL,'Pending'),
(1006,'P1006','C006','2026-01-22','Health',95000,90000,'Approved'),
(1007,'P1007','C007','2026-01-25','Motor',65000,60000,'Approved'),
(1008,'P1008','C008','2026-01-28','Life',300000,NULL,'Rejected'),
(1009,'P1009','C009','2026-02-02','Travel',55000,50000,'Approved'),
(1010,'P1010','C010','2026-02-05','Property',220000,200000,'Approved'),
(1011,'P1001','C001','2026-02-10','Health',120000,NULL,'Pending'),
(1012,'P1002','C002','2026-02-14','Motor',145000,130000,'Approved'),
(1013,'P1003','C003','2026-02-18','Life',180000,NULL,'Rejected'),
(1014,'P1004','C004','2026-02-20','Travel',35000,30000,'Approved'),
(1015,'P1005','C005','2026-02-23','Property',150000,NULL,'Pending'),
(1016,'P1006','C006','2026-03-01','Health',70000,65000,'Approved'),
(1017,'P1007','C007','2026-03-05','Motor',190000,175000,'Approved'),
(1018,'P1008','C008','2026-03-09','Life',250000,NULL,'Pending'),
(1019,'P1009','C009','2026-03-12','Travel',60000,55000,'Approved'),
(1020,'P1010','C010','2026-03-15','Property',300000,NULL,'Pending'),
(1021,'P1001','C001','2026-03-18','Health',50000,45000,'Approved'),
(1022,'P1002','C002','2026-03-22','Motor',210000,NULL,'Pending'),
(1023,'P1003','C003','2026-03-25','Life',275000,250000,'Approved'),
(1024,'P1004','C004','2026-03-28','Travel',40000,NULL,'Rejected'),
(1025,'P1005','C005','2026-03-30','Property',125000,115000,'Approved');



SELECT claim_id, policy_id, customer_id, claim_date,
       requested_amount, status
FROM insurance_claims;


SELECT policy_type,
       SUM(requested_amount) AS total_claim_amount
FROM insurance_claims
GROUP BY policy_type;


SELECT claim_id,
       policy_id,
       requested_amount,
       approved_amount,
       (requested_amount - approved_amount) AS difference
FROM insurance_claims
WHERE status = 'Approved';


SELECT status,
       AVG(requested_amount) AS average_claim_amount
FROM insurance_claims
GROUP BY status;


SELECT claim_id,
       policy_id,
       customer_id,
       requested_amount,
       status
FROM insurance_claims
WHERE requested_amount > 100000;
