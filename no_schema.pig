-- load the content
daily = load '/user/student/data/NYSE_daily';

-- column position starts at 0.
calcs = foreach daily generate $7 / 1000, $3 * 1000.0, SUBSTRING($0, 0, 1), $6 -$3;

-- dump result on console
dump calcs;