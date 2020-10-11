-- load record from airline performance file.
records = LOAD '/user/student/airline/1987.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS
    (Year, Month, DayofMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
     CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime,
     CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,Dest,
     Distance:int, TaxiIn, TaxiOut,Cancelled, CancellationCode,
     Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
     LateAircraftDelay);

-- generate a new dataset with 'carrier' column only
carriers = FOREACH records GENERATE UniqueCarrier as carrier;

-- group carrier of the same name
grouped = GROUP carriers BY carrier;

-- for each of the grouped, generate a new dataset with 'carrier' and the count
flights_by_carrier = FOREACH grouped GENERATE group, COUNT(carriers);

fs -rm -r /tmp/flights_by_carrier

-- store the result dataset into the outputdir.
STORE flights_by_carrier INTO '/tmp/flights_by_carriers';
