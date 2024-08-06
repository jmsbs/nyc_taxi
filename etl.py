import pandas as pd
from sqlalchemy import create_engine, text

# Connection string
connection_string = 'sqlite:///your_database.db'  # Replace with your actual connection string

# Create SQLAlchemy engine
engine = create_engine(connection_string)

# Create the table in SQLite
create_table_query = """
CREATE TABLE IF NOT EXISTS table_1 (
    VendorID INTEGER PRIMARY KEY AUTOINCREMENT,
    create_time DATETIME,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    passenger_count INTEGER,
    trip_distance FLOAT,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    RateCodeID INTEGER,
    store_and_fwd_flag TEXT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    payment_type INTEGER,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    trip_duration FLOAT  -- Assuming this column exist
);
"""

# # Execute the table creation query
# with engine.connect() as conn:
#     conn.execute(text(create_table_query))
#
# # Load CSV into DataFrame
# csv_file_path = '/Users/steelo/_dev/taxi_data/csvs/yellow_tripdata_2015-01.csv'  # Replace with the path to your CSV file
# df = pd.read_csv(csv_file_path)
# print("CSV loaded into MYSQL successfully")


# Run a select query and display the results in a table view
select_query = """
SELECT * FROM table_1 LIMIT 10;
"""

# Execute the select query and fetch the results into a pandas DataFrame
with engine.connect() as conn:
    result = conn.execute(text(select_query))
    df_result = pd.DataFrame(result.fetchall(), columns=result.keys())

# Displays the DataFrame as a table
print(df_result)
#
# # Calculate quantiles
# q1 = df_result['trip_duration'].quantile(0.25)
# q3 = df_result['trip_duration'].quantile(0.75)
#
# print(f'25th Percentile: {q1}')
# print(f'75th Percentile: {q3}')
#
# # Add tripId column to the table
# alter_table_query = """
# ALTER TABLE table_1 ADD COLUMN TripID INTEGER;
# """
# # Populate the tripID column
# populate_tripID_query = """
# WITH numbered AS (
#     SELECT rowid, ROW_NUMBER() OVER (ORDER BY rowid) AS tripID
#     FROM table_1
# )
# UPDATE table_1
# SET tripID = (SELECT tripID FROM numbered WHERE numbered.rowid = table_1.rowid);
# """
#
# with engine.connect() as conn:
#     conn.execute(text(alter_table_query))
#     conn.execute(text(populate_tripID_query))
#
# # Research query
# r_query = """
# SELECT COUNT(tripID) FROM table_1 WHERE trip_duration < 9.02 OR trip_duration > 20.12;
# """
#
# # Execute the research query and fetch the results into a pandas DataFrame
# with engine.connect() as conn:
#     df = pd.read_sql_query(text(r_query), conn)
#
# # Displays the DataFrame as a table
# print(df)
#
