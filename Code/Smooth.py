def smoothing(unigramsFile, bigramsFile):
    V = 0
    N = 0
    with open(unigramsFile) as u:
        for line in u.readlines():
            values = line.split()
            V += 1
            N += float(values[1])

    unigramsSmoothed = []
    with open(unigramsFile) as u2:
        for line in u2.readlines():
            values = line.split()
            smoothing = (float(values[1]) + 1) * (N / (N + V))
            values[1] = str(smoothing)
            print(values)
            unigramsSmoothed.append(values)

    bigramsSmoothed = []
    with open(bigramsFile) as b:
        for line in b.readlines():
            values = line.split()
            with open(unigramsFile) as u3:
                for uniLine in u3.readlines():
                    aux = uniLine.split()
                    if (values[0] in aux[0]):
                        unigramCount = float(aux[1])
            smoothing = ((float(values[2]) + 1) * unigramCount) / (unigramCount + V)
            values[2] = str(smoothing)
            bigramsSmoothed.append(values)

    uniSmoothFile = open("unigramsSmoothed.txt", "w+")
    for unigram in unigramsSmoothed:
        toWrite = " ".join(unigram)
        uniSmoothFile.write("%s\n" % toWrite)
    uniSmoothFile.close()

    biSmoothFile = open("bigramsSmoothed.txt", "w+")
    for bigram in bigramsSmoothed:
        toWrite = " ".join(bigram)
        biSmoothFile.write("%s\n" % toWrite)
    biSmoothFile.close()