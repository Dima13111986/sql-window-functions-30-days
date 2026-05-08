-- Завдання: для кожного продажу показати суму всіх продажів у його регіоні
SELECT
    sale_id,
    sale_date,
    region,
    salesperson,
    amount,
    -- ось вона — наша перша window function
    SUM(amount) OVER(PARTITION BY region) AS region_total
FROM dbo.sales
ORDER BY region, sale_date;

-- А ось як це виглядало б через GROUP BY — тільки 3 рядки
SELECT
    region,
    SUM(amount) AS region_total
FROM dbo.sales
GROUP BY region
ORDER BY region;

-- Покажемо: середнє по регіону + чи більший продаж за середнє
SELECT
    sale_id,
    region,
    salesperson,
    amount,
    AVG(amount) OVER (PARTITION BY region) AS region_avg,
    amount - AVG(amount) OVER (PARTITION BY region) AS diff_from_avg,
    CASE
        WHEN amount > AVG(amount) OVER (PARTITION BY region) THEN 'Above avg'
        WHEN amount < AVG(amount) OVER (PARTITION BY region) THEN 'Below avg'
        ELSE 'Equal to avg'
    END AS performance
FROM dbo.sales
ORDER BY region, amount DESC;