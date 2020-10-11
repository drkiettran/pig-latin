player = load '/user/student/data/baseball' as (name:chararray, team:chararray, 
                                                pos:bag{t:(p:chararray)}, bat:map[]);

unintended = foreach player generate bat#'base_on_balls' - bat#'ibbs';   

dump unintended;