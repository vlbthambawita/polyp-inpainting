#Image 1 - Real
#Image 2 - Fake
#Image 3 - Fake
#Image 4 - Fake
#Image 5 - Real
#Image 6 - Real
#Image 7 - Fake
#Image 8 - Real
#Image 9 - Real
#Image 10 - Fake
library(psych)
library(dplyr)
library("irr")
data = read.csv("Rating-polyps-questionnaire.csv")
relevant_data <- select(data,4,6:11,13:18,20:25,27:32,34:39,41:46,48:53,55:60,62:67,69:73)
# Analyse instances separately
q1 <- relevant_data[1:6]
q2 <- relevant_data[7:12]
q3 <- relevant_data[13:18]
q4 = relevant_data[19:24]
q5 <- relevant_data[25:30]
q6 <- relevant_data[31:36]
q7 <- relevant_data[37:42]
q8 <- relevant_data[43:48]

polyps_all = select(relevant_data, 4, 10, 16, 22, 28, 34, 40, 46, 52, 58)
polyps_fake = select(polyps, 2, 3, 4, 7, 10)
polyps_real = select(polyps, 1, 5, 6, 8, 9)
confidences = select(relevant_data, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60)

# --- Fleiss kappa
# Agreement in question 1
kappam.fleiss(q1)
# Agreement on all, fake and real polyps
kappam.fleiss(polyps_all)  # 0.0362
kappam.fleiss(polyps_fake) # 0.0714
kappam.fleiss(polyps_real) # 0.047
# Agreement on confidences
kappam.fleiss(confidences) # 0.221

# ICC
ICC(polyps_all)

# Cronbach's alpha
# check.keys=TRUE lets R find the first principal component and 
# reverse key items with negative loadings. (whatever that means)
alpha(relevant_data) #yields raw_alpha = 0.44 - i.e. very low. 
alpha(relevant_data, check.keys=TRUE) #raw_alpha = 0.94
alpha(q1) # raw_alpha = 0.36 + warnings. with check.keys: 0.82
alpha(q2) # raw_alpha = 0.16 + warnings. with check.keys: 0.76
alpha(q3) # raw_alpha = -3.7 + warnings. with check.keys: 0.57
alpha(q4) # raw_alpha = -1.3 + warnings. with check.keys: 0.9
alpha(q5) # raw_alpha = -2.2 + warnings. with check.keys: 0.83
alpha(q6) # raw_alpha = 0.17 + warnings. with check.keys: 0.86
alpha(q7) # raw_alpha = -6.5 + warnings. with check.keys: 0.81
alpha(q8) # raw_alpha = -4.1 + warnings. with check.keys: 0.93
