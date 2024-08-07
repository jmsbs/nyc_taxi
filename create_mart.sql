CREATE VIEW mart AS
SELECT tripid as TripID,
       vendorid as VendorID,
       passenger_count as PassengerCount,
       trip_distance as TripDistance,
       payment_type_text as PaymentType,
       total_amount as TotalAmount,
       trip_duration_min as TripDuration_min,
       pickup_location_name as PickupLocationName,
       pickup_borough as PickupBorough,
       pickup_zone as PickupZone,
       dropoff_location_name as DropoffLocationName,
       dropoff_borough as DropoffBorough,
       dropoff_zone as DropoffZone
FROM staging