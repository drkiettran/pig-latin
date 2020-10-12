players = load '/user/student/data/baseball' as (name:chararray, team:chararray, position:bag{t:(p:chararray)}, bat:map[]);

pos = foreach players generate name, flatten(position) as position;
-- dump pos
/**
Ben Zobrist	Tampa Bay Rays	{(Infielder),(Outfielder),(Shortstop),(Second_baseman),(Right_fielder)}	[games#297,hit_by_pitch#5,on_base_percentage#0.346,grand_slams#4,home_runs#42,at_bats#979,sacrifice_flies#11,gdb#14,sacrifice_hits#5,ibbs#6,base_on_balls#129,hits#255,rbis#148,slugging_percentage#0.459,batting_average#0.26,triples#11,doubles#46,strikeouts#188,runs#141]
Joel Zumaya	Detroit Tigers	{(Pitcher),(Relief_pitcher)}	[games#64]

(Ben Zobrist,Infielder)
(Ben Zobrist,Outfielder)
(Ben Zobrist,Shortstop)
(Ben Zobrist,Second_baseman)
(Ben Zobrist,Right_fielder)
(Joel Zumaya,Pitcher)
(Joel Zumaya,Relief_pitcher)
 */

bypos = group pos by position;

-- dump bypos