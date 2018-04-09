sed '/^n-é-verbo/ d' apostoApostarApor.out > apostoApostarApor2.out     #B1
sed -E '/(aposto).*\1.*/ d' apostoApostarApor2.out > apostoApostarApor3.out  #B2
sed '/^.*[?|#]\b/ d' apostoApostarApor3.out > apostoApostarApor4.out      #B3/4
sed -E 's/^(.*)(	)(.*)(aposto)/\3\1/g' apostoApostarApor4.out > apostoApostarApor.final    #B5/6

rm apostoApostarApor2.out apostoApostarApor3.out apostoApostarApor4.out


#grep -i -o '\b[[:alnum:]]*\b' foiIrSer5.out > foiIrSer6.out
#sort foiIrSer6.out > foiIrSer7.out
#uniq -i -c foiIrSer7.out > foiIrSer8.out

#grep -i -o '\b [[:alnum:]]*[^[[:alnum:]]]*[[:alnum:]]*\b' foiIrSer5.out > foiIrSer9.out
#sort foiIrSer9.out > foiIrSer10.out
#uniq -i -c foiIrSer10.out > foiIrSer11.out

#! a flag -i faz o output ser o input, usar quando tiver td bem
