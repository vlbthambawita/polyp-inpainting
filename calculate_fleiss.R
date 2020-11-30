#install.packages("psych",dependencies=TRUE)
#install.packages("irr",dependencies=TRUE)
library("irr")
library(psych)

#example only for all combined
#see other files for specific questions

ICC(relevant_data)

data1 = read.csv("q-all.csv")
data1

#https://en.wikipedia.org/wiki/Fleiss%27_kappa
kappam.fleiss(data1, detail = TRUE)

#https://en.wikipedia.org/wiki/Intraclass_correlation
icc(
  data1, model = "twoway", 
  type = "agreement", unit = "single"
)

#same but different types of ICC 
library(psych)
ICC(data1)