questions = LOAD '/user/osboxes/inputdata/Whquestion.txt' AS (line:chararray);
cleaned_lines = FOREACH questions GENERATE REPLACE($0, '[?]', '') AS cleaned_line;
flattend_words = FOREACH cleaned_lines GENERATE FLATTEN(TOKENIZE(cleaned_line,' ')) AS word;
filtered_words = FILTER flattend_words BY (word MATCHES 'Wh.*|what');
groups = GROUP filtered_words BY LOWER($0);
counts = FOREACH groups GENERATE group AS word, COUNT(filtered_words) AS count;
DUMP counts;

