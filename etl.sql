# noinspection SqlWithoutWhereForFile

# Calculate the mean value of the passenger_count column
SET @mean_value = (SELECT AVG(passenger_count) FROM staging WHERE passenger_count IS NOT NULL);

#Update rows where passenger_count is NULL with the calculated mean value
UPDATE staging
SET passenger_count = @mean_value
WHERE passenger_count IS NULL;

# Calculate trip duration based on PICKUP and DROPOFF datetime columns
UPDATE staging
SET trip_duration_min = TIMESTAMPDIFF(MINUTE, tpep_pickup_datetime, tpep_dropoff_datetime);

# Update the staging table with the location information from location_table
UPDATE staging s
JOIN location_table lt ON s.DOLocationID = lt.locationID
JOIN location_table lp ON s.PULocationID = lp.locationID
SET
    s.pickup_location_name = lp.zone,
    s.pickup_borough = lp.borough,
    s.pickup_zone = lp.zone,
    s.dropoff_location_name = lt.service_zone,
    s.dropoff_borough = lt.borough,
    s.dropoff_zone = lt.zone;

# Remove rows with NULL values in the columns that are required for analysis
DELETE FROM staging
WHERE trip_duration_min IS NULL
   OR pickup_location_name IS NULL
   OR dropoff_location_name IS NULL
   OR pickup_borough IS NULL
   OR dropoff_borough IS NULL
   OR pickup_zone IS NULL
   OR dropoff_zone IS NULL;

