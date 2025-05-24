REATE PARTITION FUNCTION Book_partition (start_date)  
AS RANGE RIGHT FOR VALUES ('2022-02-01', '2022-03-01', '2022-04-01',  
               '2022-05-01', '2022-06-01', '2022-07-01', '2022-08-01',   
               '2022-09-01', '2022-10-01', '2022-11-01', '2022-12-01');
GO

CREATE PARTITION SCHEME BookingPS1
    AS PARTITION Book_partition
    ALL TO ('PRIMARY') ;
GO

CREATE TABLE AirBnB.Booking (start_date)
    ON BookingPS1 (start_date) ;
GO