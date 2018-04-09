#!/bin/bash

##################################
#
# TransdutorRomanosInverso

fstcompile --isymbols=syms.txt --osymbols=syms.txt  transdutorRomanosInverso.txt | fstarcsort > transdutorRomanosInverso.fst

##################################
#
# TransdutorRomanos

fstinvert transdutorRomanosInverso.fst	> transdutorRomanos.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait transdutorRomanos.fst | dot -Tpdf  > transdutorRomanos.pdf

##################################
#
# Transdutor1
fstcompile --isymbols=syms.txt --osymbols=syms.txt  transdutorVazio.txt | fstarcsort > transdutorVazio.fst
fstcompile --isymbols=syms.txt --osymbols=syms.txt  transdutorFimPalavra.txt | fstarcsort > transdutorFimPalavra.fst

fstconcat transdutorVazio.fst transdutorFimPalavra.fst transdutorUnion1.fst
fstconcat transdutorRomanos.fst transdutorFimPalavra.fst transdutorUnion2.fst

fstunion  transdutorUnion1.fst transdutorUnion2.fst > transdutorUnion3.fst
fstclosure transdutorUnion3.fst transdutor1.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait transdutor1.fst | dot -Tpdf  > transdutor1.pdf

##################################
#
# Transdutor2
fstcompile --isymbols=syms.txt --osymbols=syms.txt  transdutor2.txt | fstarcsort > transdutor2.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait transdutor2.fst | dot -Tpdf  > transdutor2.pdf

##################################
#
# Transdutor3
fstcompile --isymbols=syms.txt --osymbols=syms.txt  transdutor3.txt | fstarcsort > transdutor3.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait transdutor3.fst | dot -Tpdf  > transdutor3.pdf

##################################
#
# TransdutorCodificador
fstcompose  transdutor1.fst transdutor2.fst > concat12.fst
fstcompose  concat12.fst transdutor3.fst > transdutorCodificador.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait transdutorCodificador.fst | dot -Tpdf  > transdutorCodificador.pdf

##################################
#
# TransdutorDescodificador

fstinvert transdutorCodificador.fst	> transdutorDescodificador.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait transdutorDescodificador.fst | dot -Tpdf  > transdutorDescodificador.pdf

##################################
#
# mensagem_a_Descodificar1

fstcompile --isymbols=syms.txt --osymbols=syms.txt  mensagem_a_Descodificar1.txt | fstarcsort > mensagem_a_Descodificar1.fst
fstcompose mensagem_a_Descodificar1.fst transdutorDescodificador.fst mensagemDescodificada1Epsilon.fst

fstrmepsilon mensagemDescodificada1Epsilon.fst mensagemDescodificada1.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait mensagemDescodificada1.fst | dot -Tpdf  > mensagemDescodificada1.pdf

##################################
#
# mensagem_a_Descodificar2

fstcompile --isymbols=syms.txt --osymbols=syms.txt  mensagem_a_Descodificar2.txt | fstarcsort > mensagem_a_Descodificar2.fst
fstcompose mensagem_a_Descodificar2.fst transdutorDescodificador.fst mensagemDescodificada2Epsilon.fst

fstrmepsilon mensagemDescodificada2Epsilon.fst mensagemDescodificada2.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait mensagemDescodificada2.fst | dot -Tpdf  > mensagemDescodificada2.pdf

##################################
#
# mensagem_a_Codificar

fstcompile --isymbols=syms.txt --osymbols=syms.txt  mensagem_a_Codificar.txt | fstarcsort > mensagem_a_Codificar.fst
fstcompose mensagem_a_Codificar.fst transdutorCodificador.fst mensagemCodificadaEpsilon.fst

fstrmepsilon mensagemCodificadaEpsilon.fst mensagemCodificada.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait mensagemCodificada.fst | dot -Tpdf  > mensagemCodificada.pdf

##################################
#
#    CleanUp
rm transdutorRomanosInverso.fst
rm transdutorVazio.fst
rm transdutorFimPalavra.fst
rm transdutorUnion1.fst
rm transdutorUnion2.fst
rm transdutorUnion3.fst
rm concat12.fst
rm mensagem_a_Descodificar1.fst
rm mensagem_a_Descodificar2.fst
rm mensagem_a_Codificar.fst
rm mensagemDescodificada1Epsilon.fst
rm mensagemDescodificada2Epsilon.fst
rm mensagemCodificadaEpsilon.fst
