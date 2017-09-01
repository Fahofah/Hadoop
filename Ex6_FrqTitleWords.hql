## 10 most frequently used words in movie titles ## 
SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(title)),1,10)) AS bigrams from movies20m;
