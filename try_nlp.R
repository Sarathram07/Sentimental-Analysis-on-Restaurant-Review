# Text Mining using Natural Language Processing#

# Importing the dataset:
dataset_org = read.delim('F:/Rstu/Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)
#View(dataset_org)
#head(dataset_org)

# Cleaning the texts (Pre-processing):
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset_org$Review))
corpus = tm_map(corpus, content_transformer(tolower))
#as.character(corpus[[1]])
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)

# Creating the Bag of Words model (Vectorization):
dtm = DocumentTermMatrix(corpus)
#dtm = removeSparseTerms(dtm, 0.999)
#dataset = as.data.frame(as.matrix(dtm))
data = as.matrix(dtm)
#View(data)
#dataset$Liked = dataset_org$Liked
#head(dataset$Liked)

#Bar Plot:
w <- rowSums(data)

w<-subset(w, w<25)
View(w)
barplot(w, 
        las=2, 
        col=rainbow(50))
