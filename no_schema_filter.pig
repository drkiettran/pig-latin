daily = load '/user/student/data/NYSE_daily';
fltrd = filter daily by $6 > $3;
-- dump fltrd;
store fltrd into '/tmp/no_schema_filter';