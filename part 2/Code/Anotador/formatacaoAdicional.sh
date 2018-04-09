#to n-grams
#sed -E ' s/[[:punct:]]//g' apostoApostarApor.final > apostoApostarApor-to-n-grams.final

#format unigrams

sed -E ' s/^(\w*)	(\w*)	.*$/\1	\2/g' apostoApostarApor-unigram.final > apostoApostarApor-unigram2.final
sort apostoApostarApor-unigram2.final > unigram.final

#rm apostoApostarApor-unigram2.final

#format bigrams

sed -E ' s/^(\w*) (\w*)	(\w*)	.*$/\1 \2	\3/g' apostoApostarApor-bigram.final > apostoApostarApor-bigram2.final
sort apostoApostarApor-bigram2.final > bigram.final

#rm apostoApostarApor-bigram2.final
