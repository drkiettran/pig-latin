-- load the book into lines
lines = LOAD '/user/student/shakespeare/tragedy/othello.txt' AS (line:chararray);

-- break line into tokens and removed non-character
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line, '-,:.;?!\' ')) as word;
-- dump words;
/*
(Look)
(on)
(the)
(tragic)
(loading)
(of)
(this)
(bed)
(This)
(is)
(thy)
(work)
(the)
(object)
(poisons)
*/


grouped = GROUP words BY word;
--dump grouped
/*
 group same word together
(fruitfulness,{(fruitfulness)})
(handkerchief,{(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief),(handkerchief)})
(heartstrings,{(heartstrings)})
(lieutenantry,{(lieutenantry)})
*/


-- count the occurrence of each word
word_count = FOREACH grouped GENERATE group, COUNT(words);
-- dump word_count;
/**
(Prerogatived,1)
(Unreconciled,1)
(acquaintance,2)
(circumstance,3)
(coloquintida,1)
(commencement,1)
(conscionable,1)
**/

-- remove the output dir
fs -rm -r /tmp/wordcount

-- store result into the output dir
STORE word_count INTO '/tmp/wordcount';

