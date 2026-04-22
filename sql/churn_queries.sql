-- Churn count by contract type
SELECT Contract, COUNT(*) AS churn_count
FROM telecom_churn
WHERE Churn = 'Yes'
GROUP BY Contract;

-- Monthly revenue loss
SELECT SUM(MonthlyCharges) AS revenue_loss
FROM telecom_churn
WHERE Churn = 'Yes';

-- High value churn customers
SELECT customerID, MonthlyCharges
FROM telecom_churn
WHERE Churn = 'Yes' AND MonthlyCharges > 70;

-- Churn by tenure segment
SELECT 
  CASE 
    WHEN tenure <= 12 THEN 'New'
    WHEN tenure <= 36 THEN 'Mid'
    ELSE 'Loyal'
  END AS segment,
  COUNT(*) AS churn_count
FROM telecom_churn
WHERE Churn = 'Yes'
GROUP BY segment;
