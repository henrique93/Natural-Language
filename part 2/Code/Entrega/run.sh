#Grupo 5
#Henrique Lourenço - 77459
#José Touret - 78215
#RUN

sed '/^n-é-verbo/ d' apostoAnotado.out > apostoAnotado2.out     #B1
sed -E '/(aposto).*\1.*/ d' apostoAnotado2.out > apostoAnotado3.out  #B2
sed '/^.*[?|#]\b/ d' apostoAnotado3.out > apostoAnotado4.out      #B3/4
sed -E 's/^(.*)(	)(.*)(aposto)/\3\1/g' apostoAnotado4.out > apostoAnotado.final    #B5/6

rm apostoAnotado2.out apostoAnotado3.out apostoAnotado4.out

sed '/^n-é-verbo/ d' fomosAnotado.out > fomosAnotado2.out     #B1
sed -E '/(aposto).*\1.*/ d' fomosAnotado2.out > fomosAnotado3.out  #B2
sed '/^.*[?|#]\b/ d' fomosAnotado3.out > fomosAnotado4.out      #B3/4
sed -E 's/^(.*)(	)(.*)(aposto)/\3\1/g' fomosAnotado4.out > fomosAnotado.final    #B5/6

rm fomosAnotado2.out fomosAnotado3.out fomosAnotado4.out

python -c "from Smooth import *; smoothing('fomosUnigramasNaoAlisado.txt', 'fomosBigramasNaoAlisado.txt')"
mv unigramsSmoothed.txt  fomosUnigramas.txt
mv bigramsSmoothed.txt fomosBigramas.txt
python -c "from Smooth import *; smoothing('apostoUnigramasNaoAlisado.txt', 'apostoBigramasNaoAlisado.txt')"
mv unigramsSmoothed.txt  apostoUnigramas.txt
mv bigramsSmoothed.txt apostoBigramas.txt



python -c "from exc2 import *; n_grams('fomosUnigramas.txt', 'fomosBigramas.txt','fomosParametrizacao.txt','fomosFrases.txt')" > fomosResultado.txt
python -c "from exc2 import *; n_grams('apostoUnigramas.txt', 'apostoBigramas.txt','apostoParametrizacao.txt','apostoFrases.txt')" > apostoResultado.txt
