Output:

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Nested loop inner join  (cost=4.85 rows=4) (actual time=0.162..0.258 rows=4 loops=1)
    -> Nested loop inner join  (cost=3.45 rows=4) (actual time=0.122..0.184 rows=4 loops=1)
        -> Nested loop inner join  (cost=2.05 rows=4) (actual time=0.108..0.138 rows=4 loops=1)
            -> Sort: booking.start_date  (cost=0.65 rows=4) (actual time=0.086..0.087 rows=4 loops=1)
                -> Filter: (booking.property_id is not null)  (cost=0.65 rows=4) (actual time=0.026..0.035 rows=4 loops=1)
                    -> Table scan on Booking  (cost=0.65 rows=4) (actual time=0.022..0.024 rows=4 loops=1)
            -> Index lookup on Payment using booking_id (booking_id=booking.booking_id)  (cost=0.28 rows=1) (actual time=0.007..0.008 rows=1 loops=4)
        -> Single-row index lookup on User using PRIMARY (user_id=booking.booking_id)  (cost=0.28 rows=1) (actual time=0.005..0.006 rows=1 loops=4)
    -> Single-row index lookup on Property using PRIMARY (property_id=booking.property_id)  (cost=0.28 rows=1) (actual time=0.012..0.013 rows=1 loops=4)
 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+