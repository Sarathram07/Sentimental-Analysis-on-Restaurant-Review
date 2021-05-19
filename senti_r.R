dataset_org = read.delim('F:/Rstu/Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)
#View(dataset_org)
#head(dataset_org)

library(sentimentr)
library(tidyverse)
cr1 = c(dataset_org$Review)
head(sentiment(cr1))
plot(sentiment_by(cr1))
head(extract_sentiment_terms(cr1))
View(emotion(cr1))
profanity(cr1)

cr2 <- dataset_org$Review
cr2 %>%
  get_sentences() %>%
  sentiment() -> senti_cr2

senti_cr2 %>%
  ggplot() + geom_density(aes(sentiment))

cr2 %>%
  get_sentences() %>%
  sentiment_by() %>%
  highlight()
  #highlight(file = "")

#text <- "the lunch is awesome. But the service is bad"
#text <- 'This is a very beautiful place, lunch is awesome. The service is not good. Worth for money'
#text %>%
  #get_sentences() %>%
  #sentiment_by() %>%
  #highlight()



