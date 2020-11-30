#install.packages("psych",dependencies=TRUE)
library(psych)
library(dplyr)
data = read.csv("Rating-polyps-questionnaire.csv")
relevant_data <- select(data,4,6:11,13:18,20:25,27:32,34:39,41:46,48:53,55:60,62:67,69:73)
alpha(relevant_data) #yields raw_alpha = 0.44 - not spectacular. 

# Analyse questions separately
q1 <- relevant_data[1:6]
alpha(q1) # raw_alpha = 0.36 + warnings regarding negative correlation
q2 <- relevant_data[7:12]
alpha(q2) # raw_alpha = 0.16 + warnings regarding negative correlation
q3 <- relevant_data[13:18]
alpha(q3) # raw_alpha = -3.7 + warnings regarding negative correlation
q4 = relevant_data[19:24]
alpha(q4) # raw_alpha = -1.3 + warnings regarding negative correlation
q5 <- relevant_data[25:30]
alpha(q5) # raw_alpha = -2.2 + warnings regarding negative correlation
q6 <- relevant_data[31:36]
alpha(q6) # raw_alpha = 0.17 + warnings regarding negative correlation
q7 <- relevant_data[37:42]
alpha(q7) # raw_alpha = -6.5 + warnings regarding negative correlation
q8 <- relevant_data[43:48]
alpha(q8) # raw_alpha = -4.1 + warnings regarding negative correlation
