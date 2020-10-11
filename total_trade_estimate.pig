daily = load '/user/student/data/NYSE_daily' as (exchange:chararray, symbol:chararray,
        date:chararray, open:float, high:float, low:float, close:float, 
        volume:int, adj_close:float);

rough = foreach daily generate volume * close;

dump rough;