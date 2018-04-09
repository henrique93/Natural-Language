sed '/^n-é-verbo/ d' fomosIrSer-2.out > fomosIrSer-2.final		#B1
sed -ri '/(fomos).*\1.*/ d' fomosIrSer-2.final   			#B2
sed -i '/^.*[?|#]\t/ d' fomosIrSer-2.final     			#B3/4
sed -ri ' s/^((.*)\t.*)fomos/\1\2/' fomosIrSer-2.final  			#B5
cat fomosIrSer-2.final | cut -d "	" -f2- > fomosIrSer-2_1.final	#B6
mv  fomosIrSer-2_1.final fomosIrSer-2.final
