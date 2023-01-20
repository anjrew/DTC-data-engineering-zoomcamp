DROP TABLE IF EXISTS public.trip;

CREATE TABLE IF NOT EXISTS public.trip (
    VendorID INT,
    lpep_pickup_datetime DATE,
    lpep_dropoff_datetime DATE,
    store_and_fwd_flag CHAR,
    RatecodeID INT,
    PULocationID INT,
    DOLocationID INT,
    passenger_count INT,
    trip_distance NUMERIC,
    fare_amount NUMERIC,
    extra NUMERIC,
    mta_tax NUMERIC,
    tip_amount NUMERIC,
    tolls_amount NUMERIC,
    ehail_fee NUMERIC,
    improvement_surcharge NUMERIC,
    total_amount NUMERIC,
    payment_type INT,
    trip_type INT,
    congestion_surcharge NUMERIC
);

COPY public.trip (
    VendorID,
    lpep_pickup_datetime,
    lpep_dropoff_datetime,
    store_and_fwd_flag,
    RatecodeID,
    PULocationID,
    DOLocationID,
    passenger_count,
    trip_distance,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    ehail_fee,
    improvement_surcharge,
    total_amount,
    payment_type,
    trip_type,
    congestion_surcharge
)
FROM :file_path
DELIMITER ',' 
CSV HEADER;