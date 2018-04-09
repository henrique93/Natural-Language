from Smooth import smoothing

def n_grams(unigramsFile, bigramsFile, parameterization, sentences):
    words = []
    param = []
    unigrams = []
    bigrams = []

    with open(parameterization) as p: #Parametrization file
        data = p.read().split()
        word = data[0]
        param.append(data[1])
        param.append(data[2])
        param.append(data[4])
    #print("PARAM: ", param)#          Debug print

    with open(unigramsFile) as u: #Unigrams and respective values file
        for line in u.readlines():
            values = line.split()
            if (values[0] in param):
                unigrams.append(values)
    #print("UNIGRAMS: ", unigrams)#          Debug print

    with open(bigramsFile) as b: #Bigrams and respective values file
        for line in b.readlines():
            values = line.split()
            if (values[0] in param or values[1] in param):
                bigrams.append(values)
    #print("BIGRAMS: ", bigrams)#          Debug print

    with open(sentences) as f: #Text with sentences file
        for line in f.readlines():
            sentence = line.split()
            index = sentence.index(word)
            aux = []
            if (index > 0):
                aux.append(sentence[index-1])
            aux.append(sentence[index])
            if (index + 1 < len(sentences)):
                aux.append(sentence[index+1])
            words.append(aux)
    #print("WORDS: ", words)#          Debug print

    for w in words:
        bigram1 = 0
        bigram2 = 0
        option1 = w
        print(w)
        index = option1.index(word)
        option1[index] = param[1]
        option2 = w
        index = option2.index(word)
        option2[index] = param[2]
        for unigram in unigrams:
            if((option1[0] or option1[1] or option1[2]) in unigram):
                unigram1 += float(unigram[1])
            elif((option2[0] or option2[1] or option2[2]) in unigram):
                unigram2 += float(unigram[1])
        for bigram in bigrams:
            if ((option1[0:1] or option1[1:2]) in bigram):
                bigram1 += float(bigram[2])
            elif (option2[0:1] in bigram or option2[1:2] in bigram):
                bigram2 += float(bigram[2])
        if (((unigram1 > unigram2) and (unigram1 > bigram2)) or ((bigram1 > unigram2) and (bigram1 > bigram2))):
            lema = option1
        elif (((unigram2 > unigram1) and (unigram2 > bigram1)) or ((bigram2 > unigram1) and (bigram2 > bigram1))):
            lema = option2
        print("O lema mais provavel para" + str(w) + "e: " + str(lema)) #lema
    #print("SENTENCE: ", sentence)#          Debug print
