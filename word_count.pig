lines = LOAD 'shakespeare' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
word_count = FOREACH grouped GENERATE group, COUNT(words);
DUMP word_count
