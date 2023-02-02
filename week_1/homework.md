# Week 1 Homework


## Prepare Postgres

1. Put these two files into the 'data' directory

Run the following command

```bash
cd ./data
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz
gzip -d /green_tripdata_2019-01.csv.gz
```

2. Run the following command with the trip_data .sql script as an example to populate the DB
```
psql -f ./sql/create_trip_data_table.sql --variable file_path="'<full_path_within_quotes_within_quotes>'" -d dtc_de_zoom_camp -U postgres
```

Run the same script for the taxi_zones



## Question Answers

1. --iidfile string

2. 3

3. 20689 
```sql
SELECT COUNT(*) FROM trip WHERE                                                           lpep_pickup_datetime = '2019-01-15';
```

4. 2019-01-15
```sql
SELECT * FROM trip                                                                        
ORDER BY trip_distance DESC                                                                                  
LIMIT 1;
```

5. 2: 1282 ; 3: 254
```sql
WITH two AS (
	SELECT ROW_NUMBER() OVER()AS rn, COUNT(PASSENGER_COUNT)
	FROM public.trip
	WHERE PASSENGER_COUNT > 1 
	AND PASSENGER_COUNT < 3
	AND LPEP_PICKUP_DATETIME = '2019-01-01'
), three AS (
	SELECT ROW_NUMBER() OVER() AS rn, COUNT(PASSENGER_COUNT)
	FROM public.trip
	WHERE PASSENGER_COUNT > 2 
	AND PASSENGER_COUNT < 4
	AND LPEP_PICKUP_DATETIME = '2019-01-01'
) SELECT two.count AS "2", three.count AS "3"
	FROM two
	JOIN three
	ON two.rn = three.rn;
```

6. Long Island City/Queens Plaza
```sql
SELECT TIP_AMOUNT, t.PULOCATIONID, t.DOLOCATIONID, Tz.LOCATIONID, TZ."zone" AS pickup_zone, tz2.LOCATIONID , TZ2."zone" AS dropoff_zone  
FROM TRIP T
JOIN TAXI_ZONE TZ  ON t.PULOCATIONID  = tz.LOCATIONID 
JOIN TAXI_ZONE TZ2  ON t.DOLOCATIONID  = TZ2.LOCATIONID
WHERE tz."zone" = 'Astoria'
ORDER BY t.TIP_AMOUNT DESC;
```
