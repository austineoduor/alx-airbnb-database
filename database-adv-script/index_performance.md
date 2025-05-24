+----------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN BEFORE CREATING INDEX                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+----------------------------------------------------------------------------------------------------------------------------------------------+
| -> Sort: booking.start_date  (actual time=0.220..0.228 rows=7 loops=1)
    -> Stream results  (cost=3.40 rows=7) (actual time=0.104..0.192 rows=7 loops=1)
        -> Nested loop left join  (cost=3.40 rows=7) (actual time=0.057..0.116 rows=7 loops=1)
            -> Table scan on User  (cost=0.95 rows=7) (actual time=0.031..0.039 rows=6 loops=1)
            -> Index lookup on Booking using user_id (user_id=`user`.user_id)  (cost=0.26 rows=1) (actual time=0.007..0.008 rows=1 loops=6)
 |
+----------------------------------------------------------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN AFTER CREATING INDEX                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+----------------------------------------------------------------------------------------------------------------------------------------------+
| -> Sort: booking.start_date  (actual time=0.852..0.860 rows=7 loops=1)
    -> Stream results  (cost=3.18 rows=28) (actual time=0.101..0.151 rows=7 loops=1)
        -> Left hash join (booking.user_id = `user`.user_id)  (cost=3.18 rows=28) (actual time=0.080..0.100 rows=7 loops=1)
            -> Table scan on User  (cost=0.95 rows=7) (actual time=0.033..0.041 rows=6 loops=1)
            -> Hash
                -> Table scan on Booking  (cost=0.10 rows=4) (actual time=0.019..0.024 rows=4 loops=1)
 |
 |
+----------------------------------------------------------------------------------------------------------------------------------------------+