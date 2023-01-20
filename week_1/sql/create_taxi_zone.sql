CREATE TABLE IF NOT EXISTS public.taxi_zone (
    LocationID INT,
    Borough VARCHAR(255),
    Zone VARCHAR(255),
    service_zone VARCHAR(255)
);
COPY public.taxi_zone (
    LocationID,
    Borough,
    Zone,
    service_zone
)
FROM :file_path
DELIMITER ',' 
CSV HEADER;