-- average_dividend.pig
-- load data from a hdfs file.

dividends = load '/user/student/data/NYSE_dividends' as (exchange, symbol, date, dividend);

-- group rows by ticker symbol
grouped = group dividends by symbol;
-- dump grouped;

-- calculate average dividend per symbol
avg = foreach grouped generate group, AVG(dividends.dividend);

-- remove the output dir
-- fs -rm -r /tmp/average_dividend

-- store result into an output dir
store avg into '/tmp/average_dividend';