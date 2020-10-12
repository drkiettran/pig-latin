-- load input from a file

lines = load '/user/student/shakespeare/tragedy/othello.txt' as (line);

-- TOKENIZE splits the line into a field for each word.
-- flatten will take the collection of records returned 
-- by TOKENIZE and produce a separate record for each one,
-- calling the single field in the record word.


words = foreach lines generate flatten (TOKENIZE(line, '-,:.;?!\' ')) as word;
dump words;

/**
Myself will straight aboard: and to the state
    This heavy act with heavy heart relate.

    Exeunt


(Myself)
(will)
(straight)
(aboard)
(and)
(to)
(the)
(state)
(This)
(heavy)
(act)
(with)
(heavy)
(heart)
(relate)
()
(Exeunt)
 **/
-- group them together by each word

grpd = group words by word;

-- count them words.

cntd = foreach grpd generate group, COUNT(words);

-- print out the results
-- dump cntd;

-- remove the output dir
-- fs -rm -r /tmp/pig_count

-- store result into a file in outdir

STORE cntd INTO '/tmp/pig_count';
