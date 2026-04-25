
-- Q1. Show all vehicles that use Diesel fuel.
SELECT * 
FROM vehicle_info 
WHERE fuel = "diesel";

-- Q2. Display vehicle name, year, and brand for all vehicles.
SELECT name, year, brand 
FROM vehicle_info;

-- Q3. Find all sales where selling price is below 5,00,000.
SELECT * 
FROM vehicle_sales 
WHERE selling_price < 500000;

-- Q4. Find fuel types where average selling price is greater than 6,00,000.
SELECT fuel, AVG(selling_price) AS avg_price
FROM vehicle_info vi
JOIN vehicle_sales vs
ON vi.vehicle_uid = vs.vehicle_uid
GROUP BY fuel
HAVING AVG(selling_price) > 600000;

-- Q5. Find brands that have more than 50 vehicles listed.
SELECT brand, COUNT(*) 
FROM vehicle_info
GROUP BY brand
HAVING COUNT(*) > 50;

-- Q6. Show transmission types where the average selling price is greater than 7,00,000 AND the total number of vehicles is at least 30.
SELECT transmission, AVG(selling_price) AS avg_price, COUNT(*) 
FROM vehicle_sales vs
JOIN vehicle_info vi
ON vi.vehicle_uid = vs.vehicle_uid
GROUP BY transmission
HAVING AVG(selling_price) > 700000 
AND COUNT(*) >= 30;

-- Q7. Find price categories where the average km driven is above 75,000, but only include categories that have more than 20 vehicles AND only count Diesel vehicles.
SELECT price_category, AVG(km_driven), COUNT(*) 
FROM vehicle_sales vs
JOIN vehicle_info vi
ON vi.vehicle_uid = vs.vehicle_uid
WHERE fuel = "diesel"
GROUP BY price_category
HAVING AVG(km_driven) > 75000 
AND COUNT(*) > 20;

-- Q8. Find vehicles whose selling price is higher than the overall average selling price.
SELECT name, selling_price 
FROM vehicle_info vi
JOIN vehicle_sales vs
ON vi.vehicle_uid = vs.vehicle_uid
WHERE selling_price > (
    SELECT AVG(selling_price) 
    FROM vehicle_sales	);

-- Q9. Find brands whose average selling price is greater than the average selling price of Toyota vehicles.
SELECT brand, AVG(selling_price) 
FROM vehicle_info vi
JOIN vehicle_sales vs
ON vi.vehicle_uid = vs.vehicle_uid
GROUP BY brand
HAVING AVG(selling_price) > (
    SELECT AVG(selling_price)
    FROM vehicle_info vi
    JOIN vehicle_sales vs
    ON vi.vehicle_uid = vs.vehicle_uid
    WHERE brand = "toyota");

-- Q10. Find fuel types where total selling price is higher than total selling price of Petrol vehicles.
SELECT fuel, SUM(selling_price) 
FROM vehicle_info vi
JOIN vehicle_sales vs
ON vi.vehicle_uid = vs.vehicle_uid
GROUP BY fuel
HAVING SUM(selling_price) > (
    SELECT SUM(selling_price)
    FROM vehicle_info vi
    JOIN vehicle_sales vs
    ON vi.vehicle_uid = vs.vehicle_uid
    WHERE fuel = "petrol");





 

