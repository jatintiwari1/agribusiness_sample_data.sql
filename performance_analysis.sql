USE agro;

-- =========================================================
-- AGRIBUSINESS PERFORMANCE ANALYSIS
-- Synthetic academic dataset
-- =========================================================

-- KPI 1: Production and Average Yield by Crop
SELECT
    c.crop_name,
    SUM(h.quantity_kg) AS total_production_kg,
    ROUND(AVG(h.quantity_kg), 2) AS average_yield_per_harvest_kg,
    COUNT(h.harvest_id) AS number_of_harvests
FROM Harvest h
JOIN Planting p ON h.planting_id = p.planting_id
JOIN Crop c ON p.crop_id = c.crop_id
GROUP BY c.crop_id, c.crop_name
ORDER BY total_production_kg DESC;


-- KPI 2: Yield per Hectare by Field
SELECT
    f.farm_name,
    fi.field_name,
    c.crop_name,
    fi.area_hectares,
    SUM(h.quantity_kg) AS total_production_kg,
    ROUND(SUM(h.quantity_kg) / NULLIF(fi.area_hectares, 0), 2) AS yield_per_hectare_kg
FROM Harvest h
JOIN Planting p ON h.planting_id = p.planting_id
JOIN Field fi ON p.field_id = fi.field_id
JOIN Farm f ON fi.farm_id = f.farm_id
JOIN Crop c ON p.crop_id = c.crop_id
GROUP BY f.farm_name, fi.field_id, fi.field_name, c.crop_name, fi.area_hectares
ORDER BY yield_per_hectare_kg DESC;


-- KPI 3: Operational Cost by Farm
-- Operational cost includes inputs, labour and recorded expenses.
SELECT
    f.farm_name,
    ROUND(COALESCE(ip.input_cost, 0), 2) AS input_cost,
    ROUND(COALESCE(lc.labour_cost, 0), 2) AS labour_cost,
    ROUND(COALESCE(ec.other_expenses, 0), 2) AS other_expenses,
    ROUND(
        COALESCE(ip.input_cost, 0)
        + COALESCE(lc.labour_cost, 0)
        + COALESCE(ec.other_expenses, 0),
        2
    ) AS total_operational_cost
FROM Farm f
LEFT JOIN (
    SELECT
        farm_id,
        SUM(quantity * unit_cost) AS input_cost
    FROM Input_Purchase
    GROUP BY farm_id
) ip ON f.farm_id = ip.farm_id
LEFT JOIN (
    SELECT
        fi.farm_id,
        SUM(l.hours_worked * e.wage_rate) AS labour_cost
    FROM Labor l
    JOIN Employee e ON l.employee_id = e.employee_id
    JOIN Planting p ON l.planting_id = p.planting_id
    JOIN Field fi ON p.field_id = fi.field_id
    GROUP BY fi.farm_id
) lc ON f.farm_id = lc.farm_id
LEFT JOIN (
    SELECT
        farm_id,
        SUM(amount) AS other_expenses
    FROM Expense
    GROUP BY farm_id
) ec ON f.farm_id = ec.farm_id
ORDER BY total_operational_cost DESC;


-- KPI 4: Cost per Kg of Production
SELECT
    f.farm_name,
    ROUND(cost.total_operational_cost, 2) AS total_operational_cost,
    ROUND(prod.total_production_kg, 2) AS total_production_kg,
    ROUND(
        cost.total_operational_cost / NULLIF(prod.total_production_kg, 0),
        2
    ) AS cost_per_kg
FROM Farm f
JOIN (
    SELECT
        fi.farm_id,
        SUM(h.quantity_kg) AS total_production_kg
    FROM Harvest h
    JOIN Planting p ON h.planting_id = p.planting_id
    JOIN Field fi ON p.field_id = fi.field_id
    GROUP BY fi.farm_id
) prod ON f.farm_id = prod.farm_id
JOIN (
    SELECT
        f1.farm_id,
        COALESCE(ip.input_cost, 0)
        + COALESCE(lc.labour_cost, 0)
        + COALESCE(ec.other_expenses, 0) AS total_operational_cost
    FROM Farm f1
    LEFT JOIN (
        SELECT
            farm_id,
            SUM(quantity * unit_cost) AS input_cost
        FROM Input_Purchase
        GROUP BY farm_id
    ) ip ON f1.farm_id = ip.farm_id
    LEFT JOIN (
        SELECT
            fi.farm_id,
            SUM(l.hours_worked * e.wage_rate) AS labour_cost
        FROM Labor l
        JOIN Employee e ON l.employee_id = e.employee_id
        JOIN Planting p ON l.planting_id = p.planting_id
        JOIN Field fi ON p.field_id = fi.field_id
        GROUP BY fi.farm_id
    ) lc ON f1.farm_id = lc.farm_id
    LEFT JOIN (
        SELECT
            farm_id,
            SUM(amount) AS other_expenses
        FROM Expense
        GROUP BY farm_id
    ) ec ON f1.farm_id = ec.farm_id
) cost ON f.farm_id = cost.farm_id
ORDER BY cost_per_kg ASC;


-- KPI 5: Crop-wise Revenue
SELECT
    c.crop_name,
    SUM(s.quantity_sold_kg) AS quantity_sold_kg,
    ROUND(SUM(s.quantity_sold_kg * s.price_per_kg), 2) AS total_revenue
FROM Sale s
JOIN Harvest h ON s.harvest_id = h.harvest_id
JOIN Planting p ON h.planting_id = p.planting_id
JOIN Crop c ON p.crop_id = c.crop_id
GROUP BY c.crop_id, c.crop_name
ORDER BY total_revenue DESC;


-- KPI 6: Monthly Sales Trend
SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    ROUND(SUM(s.quantity_sold_kg * s.price_per_kg), 2) AS revenue
FROM Sale s
GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m')
ORDER BY month;


-- KPI 7: Weather Impact
SELECT
    ROUND(w.temperature_c, 0) AS temperature,
    ROUND(AVG(h.quantity_kg), 2) AS avg_yield_kg
FROM Weather_Log w
JOIN Farm f ON w.farm_id = f.farm_id
JOIN Field fi ON f.farm_id = fi.farm_id
JOIN Planting p ON fi.field_id = p.field_id
JOIN Harvest h ON p.planting_id = h.planting_id
GROUP BY ROUND(w.temperature_c, 0)
ORDER BY temperature;


-- KPI 8: Expense Category Analysis
SELECT
    category,
    ROUND(SUM(amount), 2) AS total_spent
FROM Expense
GROUP BY category
ORDER BY total_spent DESC;


-- KPI 9: Farm-wise Revenue, Cost and Estimated Profit
SELECT
    f.farm_name,
    ROUND(COALESCE(rev.total_revenue, 0), 2) AS total_revenue,
    ROUND(COALESCE(cost.total_operational_cost, 0), 2) AS total_operational_cost,
    ROUND(
        COALESCE(rev.total_revenue, 0)
        - COALESCE(cost.total_operational_cost, 0),
        2
    ) AS estimated_profit
FROM Farm f
LEFT JOIN (
    SELECT
        fi.farm_id,
        SUM(s.quantity_sold_kg * s.price_per_kg) AS total_revenue
    FROM Sale s
    JOIN Harvest h ON s.harvest_id = h.harvest_id
    JOIN Planting p ON h.planting_id = p.planting_id
    JOIN Field fi ON p.field_id = fi.field_id
    GROUP BY fi.farm_id
) rev ON f.farm_id = rev.farm_id
LEFT JOIN (
    SELECT
        f1.farm_id,
        COALESCE(ip.input_cost, 0)
        + COALESCE(lc.labour_cost, 0)
        + COALESCE(ec.other_expenses, 0) AS total_operational_cost
    FROM Farm f1
    LEFT JOIN (
        SELECT farm_id, SUM(quantity * unit_cost) AS input_cost
        FROM Input_Purchase
        GROUP BY farm_id
    ) ip ON f1.farm_id = ip.farm_id
    LEFT JOIN (
        SELECT
            fi.farm_id,
            SUM(l.hours_worked * e.wage_rate) AS labour_cost
        FROM Labor l
        JOIN Employee e ON l.employee_id = e.employee_id
        JOIN Planting p ON l.planting_id = p.planting_id
        JOIN Field fi ON p.field_id = fi.field_id
        GROUP BY fi.farm_id
    ) lc ON f1.farm_id = lc.farm_id
    LEFT JOIN (
        SELECT farm_id, SUM(amount) AS other_expenses
        FROM Expense
        GROUP BY farm_id
    ) ec ON f1.farm_id = ec.farm_id
) cost ON f.farm_id = cost.farm_id
ORDER BY estimated_profit DESC;
