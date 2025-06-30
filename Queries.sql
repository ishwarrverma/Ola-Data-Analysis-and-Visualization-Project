Create Database Ola;
Use Ola;

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings as
SELECT * FROM bookings2
WHERE Booking_Status = 'Success';

SELECT * FROM successful_bookings;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW Ride_Distance_for_each_vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings2
GROUP BY Vehicle_Type;

SELECT * FROM Ride_Distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW Cancelled_Rides_by_Customers as
SELECT COUNT(*) FROM bookings2 
WHERE Booking_Status = ('Canceled by Customer');

SELECT * FROM Cancelled_Rides_by_Customers;

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers as
SELECT Customer_ID, COUNT(BOOKING_ID) as total_rides
FROM bookings2
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW cancelled_by_drivers_P_C_issues as
SELECT COUNT(*) FROM bookings2
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM cancelled_by_drivers_P_C_issues;

#6.Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_min_d_rating_PrimeSedan as 
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings2 WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM max_min_d_rating_PrimeSedan;

#7. Retrieve all rides where payment was made using UPI:

CREATE VIEW All_Rides_Payment_UPI as
SELECT * FROM bookings2 
WHERE Payment_Method = 'UPI';

SELECT * FROM All_Rides_Payment_UPI;

#8. Find the average customer rating per vehicle type:
CREATE VIEW average_customer_rating_per_vehicle as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_rating
FROM bookings2
GROUP BY Vehicle_Type;

SELECT * FROM average_customer_rating_per_vehicle;

#9. Calculate the total booking value of rides completed successfully:

CREATE VIEW total_sucsessfull_booking_value as
SELECT SUM(Booking_Value) as total_successfull_value
FROM bookings2
WHERE Booking_Status = 'Success';

SELECT * FROM  total_sucsessfull_booking_value;

#10. List all incomplete rides along with the reason
CREATE VIEW incomplete_rides_reasons as
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings2
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM incomplete_rides_reasons;