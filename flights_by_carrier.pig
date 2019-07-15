records = LOAD 'airline/1987.csv' USING PigStorage(',') AS
    (Year,Month,DayofMonth,DayOfWeek,DepTime,CRSDepTime,ArrTime,
    CRSArrTime,UniqueCarrier,FlightNum,TailNum,ActualElapsedTime,
    CRSElapsedTime,AirTime,ArrDelay,DepDelay,Origin,Dest,
    Distance:int,TaxiIn,TaxiOut,Cancelled,CancellationCode,
    Diverted,CarrierDelay,WeatherDelay,NASDelay,SecurityDelay,
    LateAircraftDelay);
carriers = FOREACH records GENERATE UniqueCarrier as carrier;
grouped = GROUP carriers BY carrier;
flights_by_carrier = FOREACH grouped GENERATE group, COUNT(carriers);
STORE flights_by_carrier INTO 'flights_by_carriers';
