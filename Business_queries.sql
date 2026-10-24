SELECT 
    customer_id,
    first_name || ' ' || last_name AS Customer_Name,
    email,
    customer_tier,
    COUNT(order_id) AS Total_Orders,
    MAX(order_date) AS Last_Purchase_Date
FROM customers 
LEFT JOIN orders USING (customer_id)
GROUP BY customer_id
ORDER BY Last_Purchase_Date DESC;

SELECT 
    sku,
    product_name,
    base_price,
    cost_price,
    ROUND(base_price - cost_price, 2) AS Profit_Per_Unit,
    ROUND(((base_price - cost_price) / base_price) * 100, 2) AS Margin_Percentage
FROM products
ORDER BY Margin_Percentage DESC;
