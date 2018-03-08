#!/bin/bash



cat $1 | sed 's/[^a-zA-Z-]/ /g' \
| sed 's/[,.]/ /g' \
| tr '[:upper:]' '[:lower:]' \
| tr ' ' '
' \
| sed '/^$/d' \
| sed '/^[a-z]$/d' > all_words.txt


#cat all_words.txt

for i in `cat stopwords.txt`;
	do cat all_words.txt | grep -v -w $i > dummy.txt;
	mv dummy.txt all_words.txt;
done

cat all_words.txt | sort | uniq -c | sort -r > frequencies.txt

#uniq -c < all_words.txt | sort -r -n > frequencies.txt

cat frequencies.txt | head -n$2 > output.txt

cat output.txt
