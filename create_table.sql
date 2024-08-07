CREATE TABLE IF NOT EXISTS staging (
    tripID INT AUTO_INCREMENT PRIMARY KEY,
    VendorID INT,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    tpep_pickup_datetime DATETIME NOT NULL,
    tpep_dropoff_datetime DATETIME NOT NULL,
    passenger_count INT,
    trip_distance DECIMAL(10, 2),
    RateCodeID INT,
    store_and_fwd_flag CHAR(1), # 'Y' or 'N' for store and forward flag in case the trip record was held in vehicle memory before sending to the vendor.
    payment_type INT,
    payment_type_text VARCHAR(255),
    PULocationID INT,
    DOLocationID INT,
    fare_amount DECIMAL(10, 2),
    extra DECIMAL(10, 2),
    mta_tax DECIMAL(10, 2),
    tip_amount DECIMAL(10, 2),
    tolls_amount DECIMAL(10, 2),
    improvement_surcharge DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    trip_duration_min INT,
    congestion_surcharge DECIMAL(10, 2),
    Airport_fee DECIMAL(10, 2),
    pickup_location_name VARCHAR(255),
    pickup_borough VARCHAR(255),
    pickup_zone VARCHAR(255),
    dropoff_location_name VARCHAR(255),
    dropoff_borough VARCHAR(255),
    dropoff_zone VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS location_table (
    locationID INT AUTO_INCREMENT PRIMARY KEY,
    service_zone VARCHAR(255),
    borough VARCHAR(255),
    zone VARCHAR(255)
);
