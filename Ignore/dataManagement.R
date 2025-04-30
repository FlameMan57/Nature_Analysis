# __________________________________________________

# ---- DATA MANAGEMENT ----
# __________________________________________________

# ==== Basic Operations ====

# == equality
# >= greater than or equal
# <= less than or equal
# > greater than
# < less than
# != not equal to

# __________________________________________________

# ==== Identify missing data ==== 

# Variable using 9 for missing label
# Assign 9 to be NA
myData$VAR1[myData$VAR1 == 9 ] <- NA

# __________________________________________________

# ==== Recoding based on skip patterns ====

myData$VAR1[is.na(myData$VAR1)] <- 0

# __________________________________________________

# ==== Collapsing response categories ====

myData$new_region[myData$region == 1 | myData$region == 2 | myData$region == 3 | myData$region == 5 | myData$region == 6] <- 1
myData$new_region[myData$region == 4 | myData$region == 7 | myData$region == 8 | myData$region == 9] <-2

# __________________________________________________

# ==== Aggregating across variables ====

myData$anxiety <- rep(0, nrow(myData))
myData$anxiety[myData$socphob == 1 | myData$gad==1 |
                 myData$panic == 1 | myData$agora==1 |
                 myData$ocd == 1] <- 1
myData$anxiety[is.na(myData$socphob) & is.na(myData$gad) &
                 is.na(myData$panic) & is.na(myData$agora) &
                 is.na(myData$ocd)] <- NA

# __________________________________________________

# ==== Create a quantitative variable ====

myData$nd_sum <- myData$nd_symptom1 +myData$nd_symptom2 +
  myData$nd_symptom3 + myData$nd_symptom4

# __________________________________________________

# ==== Labeling variables ==== 

# for frequency tables
library (Hmisc)
label(myData$VAR1) <- "label"

# __________________________________________________

# ==== Renaming variables ====

names(myData)[names(myData)== "VAR1"] <- "newvarname"

# __________________________________________________

# ==== Labeling variable responses/values ==== 

# Because the function doesn’t name the existing levels, 
# make sure you have them all in the right order.
levels(myData$VAR1)
levels(myData$VAR1) <- c("value0label", "value1label",
                         "value2label", "value3label")

# __________________________________________________

# ==== Sample subset ==== 

title_of_subsetted_data <- myData[myData$diabetes2 == 1, ]

# __________________________________________________

# ---- End ----























