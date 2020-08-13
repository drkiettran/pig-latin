records = LOAD '/user/student/airline/1987.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS
    (Year, Month, DayofMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime,
     CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime,
     CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin,Dest,
     Distance:int, TaxiIn, TaxiOut,Cancelled, CancellationCode,
     Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay,
     LateAircraftDelay);
milage_recs = GROUP records ALL;
tot_miles = FOREACH milage_recs GENERATE SUM(records.Distance);
STORE tot_miles INTO '/tmp/totalmiles';