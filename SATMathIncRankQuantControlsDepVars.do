*=====================================================================================================================================================================
*Date: January 2022 --> Latest Update: January 2022
*Paper: SAT Math Scores and Income Percentile Rank, Quantile, and Mobility
*
*This code adds the total math credits required for graduation variable, renames variables, labels variables, drops cases with missing controls, creates dummies, 
*converts gross household income into real gross household income, and generates necessary controls and dep. variables to prepare for a merge with geocode location 
*data. 
*
*database used: SATMathIncomeRankQuantile.csv
*				
*output: SATMathIncRankQuantControlsDepVars.dta
*
*key variables: -sex
*				-race/ethnicity
*				-birth month
*				-birth year
*				-total advanced high school mathematics credits earned
*				-highest SAT math score
*				-gross household income between 1996 and 1999
*				-household income to poverty ratio 1996 to 1999
*				-household size in 1997
*				-relationship to adults in household (both biological parents or not)
*				-labor income in 2017 and 2019
*				-total number of mathematics credits required for graduation
*							
*=====================================================================================================================================================================

clear

clear matrix

set mem 500m

log using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\logfiles\SATMathIncRankQuantControlsDepVars.smcl"

*open NLSY97 downloaded data 
import delimited "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\rawdata\SATMathIncomeRankQuantile.csv"

*sort by id
sort r0000100

*merge datasets to add total mathematics credits required for graduation 
merge 1:1 r0000100 using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\rawdata\TotalMathCreditsRequired.dta"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles"
cd $PATH

*Create labels from NLSY97 file download
label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values r0000100 vlR0000100

label define vlR0536300 1 "Male"  2 "Female"  0 "No Information" 
label values r0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values r0536401 vlR0536401

label define vlR1204500 -999999 "-999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999: 200001+" 
label values r1204500 vlR1204500

label define vlR1204900 0 "0"  1 "1 TO 99: .01-.99"  100 "100 TO 199: 1.00-1.99"  200 "200 TO 299: 2.00-2.99"  300 "300 TO 399: 3.00-3.99"  400 "400 TO 499: 4.00-4.99"  500 "500 TO 599: 5.00-5.99"  600 "600 TO 699: 6.00-6.99"  700 "700 TO 799: 7.00-7.99"  800 "800 TO 899: 8.00-8.99"  900 "900 TO 999: 9.00-9.99"  1000 "1000 TO 1099: 10.00-10.99"  1100 "1100 TO 1199: 11.00-11.99"  1200 "1200 TO 1299: 12.00-12.99"  1300 "1300 TO 1399: 13.00-13.99"  1400 "1400 TO 1499: 14.00-14.99"  1500 "1500 TO 1599: 15.00-15.99"  1600 "1600 TO 1699: 16.00-16.99"  1700 "1700 TO 1799: 17.00-17.99"  1800 "1800 TO 1899: 18.00-18.99"  1900 "1900 TO 1999: 19.00-19.99"  2000 "2000 TO 2999: 20.00-29.99"  3000 "3000 TO 9999: 30.00+" 
label values r1204900 vlR1204900

label define vlR1205300 1 "Both biological parents"  2 "Two parents, biological mother"  3 "Two parents, biological father"  4 "Biological mother only"  5 "Biological father only"  6 "Adoptive parent(s)"  7 "Foster parent(s)"  8 "No parents, grandparents"  9 "No parents, other relatives"  10 "Anything else" 
label values r1205300 vlR1205300

label define vlR1205400 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10"  11 "11"  12 "12"  13 "13"  14 "14"  15 "15"  16 "16"  17 "17"  18 "18"  19 "19"  20 "20 TO 99: 20+" 
label values r1205400 vlR1205400

label define vlR1235800 1 "Cross-sectional"  0 "Oversample" 
label values r1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values r1482600 vlR1482600

label define vlR2563300 -999999 "-999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999: 200001+" 
label values r2563300 vlR2563300

label define vlR2563500 0 "0"  1 "1 TO 99: .01-.99"  100 "100 TO 199: 1.00-1.99"  200 "200 TO 299: 2.00-2.99"  300 "300 TO 399: 3.00-3.99"  400 "400 TO 499: 4.00-4.99"  500 "500 TO 599: 5.00-5.99"  600 "600 TO 699: 6.00-6.99"  700 "700 TO 799: 7.00-7.99"  800 "800 TO 899: 8.00-8.99"  900 "900 TO 999: 9.00-9.99"  1000 "1000 TO 1099: 10.00-10.99"  1100 "1100 TO 1199: 11.00-11.99"  1200 "1200 TO 1299: 12.00-12.99"  1300 "1300 TO 1399: 13.00-13.99"  1400 "1400 TO 1499: 14.00-14.99"  1500 "1500 TO 1599: 15.00-15.99"  1600 "1600 TO 1699: 16.00-16.99"  1700 "1700 TO 1799: 17.00-17.99"  1800 "1800 TO 1899: 18.00-18.99"  1900 "1900 TO 1999: 19.00-19.99"  2000 "2000 TO 2999: 20.00-29.99"  3000 "3000 TO 9999: 30.00+" 
label values r2563500 vlR2563500

label define vlR3884900 -999999 "-999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999: 200001+" 
label values r3884900 vlR3884900

label define vlR3885100 0 "0"  1 "1 TO 99: .01-.99"  100 "100 TO 199: 1.00-1.99"  200 "200 TO 299: 2.00-2.99"  300 "300 TO 399: 3.00-3.99"  400 "400 TO 499: 4.00-4.99"  500 "500 TO 599: 5.00-5.99"  600 "600 TO 699: 6.00-6.99"  700 "700 TO 799: 7.00-7.99"  800 "800 TO 899: 8.00-8.99"  900 "900 TO 999: 9.00-9.99"  1000 "1000 TO 1099: 10.00-10.99"  1100 "1100 TO 1199: 11.00-11.99"  1200 "1200 TO 1299: 12.00-12.99"  1300 "1300 TO 1399: 13.00-13.99"  1400 "1400 TO 1499: 14.00-14.99"  1500 "1500 TO 1599: 15.00-15.99"  1600 "1600 TO 1699: 16.00-16.99"  1700 "1700 TO 1799: 17.00-17.99"  1800 "1800 TO 1899: 18.00-18.99"  1900 "1900 TO 1999: 19.00-19.99"  2000 "2000 TO 2999: 20.00-29.99"  3000 "3000 TO 9999: 30.00+" 
label values r3885100 vlR3885100

label define vlR9864600 -8 "-8: Invalid Carnegie credits or only pre-hs courses"  -7 "-7: Did not take the course"  -6 "-6: Took the course but Carnegie credits missing"  0 "0 TO 250: 0 to 2.50 Credits"  251 "251 TO 500: 2.51 to 5.00 Credits"  501 "501 TO 750: 5.01 to 7.50 Credits"  751 "751 TO 1000: 7.51 to 10.00 Credits"  1001 "1001 TO 1250: 10.01 to 12.50 Credits" 
label values r9864600 vlR9864600

label define vlU2857200 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999"  10000 "10000 TO 14999"  15000 "15000 TO 19999"  20000 "20000 TO 24999"  25000 "25000 TO 49999"  50000 "50000 TO 99999999: 50000+" 
label values u2857200 vlU2857200

label define vlU4282300 0 "0"  1 "1 TO 4999"  5000 "5000 TO 9999"  10000 "10000 TO 14999"  15000 "15000 TO 19999"  20000 "20000 TO 24999"  25000 "25000 TO 29999"  30000 "30000 TO 39999"  40000 "40000 TO 49999"  50000 "50000 TO 59999"  60000 "60000 TO 69999"  70000 "70000 TO 79999"  80000 "80000 TO 89999"  90000 "90000 TO 99999"  100000 "100000 TO 149999"  150000 "150000 TO 99999999: 150000+" 
label values u4282300 vlU4282300

label define vlZ9033700 1 "200 - 300"  2 "301 - 400"  3 "401 - 500"  4 "501 - 600"  5 "601 - 700"  6 "701 - 800"  0 "Have not yet received the scores" 
label values z9033700 vlZ9033700

*rename variables according to NLSY97 download
rename r0000100 PUBID_1997 

rename r0536300 KEY_SEX_1997
 
rename r0536401 KEY_DATE_M_1997
 
rename r0536402 KEY_BDATE_Y_1997
 
rename r1204500 CV_INCOME_GROSS_YR_1997 

rename r1204900 CV_HH_POV_RATIO_1997 

rename r1205300 CV_YTH_REL_HH_CURRENT_1997 

rename r1205400 CV_HH_SIZE_1997 

rename r1235800 CV_SAMPLE_TYPE_1997 

rename r1482600 KEY_RACE_ETHNICITY_1997
 
rename r2563300 CV_INCOME_GROSS_YR_1998
 
rename r2563500 CV_HH_POV_RATIO_1998
 
rename r3884900 CV_INCOME_GROSS_YR_1999 

rename r3885100 CV_HH_POV_RATIO_1999
 
rename r9864600 TRANS_TOT_ADV_MATH_HSTR 
   
rename u2857200 YINC_1700_2017  

rename u4282300 YINC_1700_2019

rename z9033700 CVC_SAT_MATH_SCORE_2007_XRND

rename r9872900 TRANS_GRADREQ_MATH_HSTR

*rename to id
rename PUBID_1997 id

*rename to sex
rename KEY_SEX_1997 sex

*rename to birth month
rename KEY_DATE_M_1997 birthmonth

*rename to birth year
rename KEY_BDATE_Y_1997 birthyear

*rename to household income 97
rename CV_INCOME_GROSS_YR_1997 hhincome97

*rename to household income to poverty ratio 97
rename CV_HH_POV_RATIO_1997 hhincomepovratio97

*rename to head of household 97
rename CV_YTH_REL_HH_CURRENT_1997 headofhousehold97

*rename to to household size 97
rename CV_HH_SIZE_1997 hhsize97

*rename to sample type 
rename CV_SAMPLE_TYPE_1997 sampletype

*rename to race ethnicity
rename KEY_RACE_ETHNICITY_1997 raceethnicity

*rename to household income 98
rename CV_INCOME_GROSS_YR_1998 hhincome98 

*rename to household income to poverty ratio 98
rename CV_HH_POV_RATIO_1998 hhincomepovratio98

*rename to household income 99
rename CV_INCOME_GROSS_YR_1999 hhincome99

*rename to household income to poverty ratio 99
rename CV_HH_POV_RATIO_1999 hhincomepovratio99

*rename to total advanced math credits
rename TRANS_TOT_ADV_MATH_HSTR totaladvmathcredits

*rename to income 2017
rename YINC_1700_2017 income2017

*rename to income 2019
rename YINC_1700_2019 income2019

*rename to SAT math score
rename CVC_SAT_MATH_SCORE_2007_XRND satmathscore

*rename to total math credits required
rename TRANS_GRADREQ_MATH_HSTR totalmathcreditsreq

*label variables
label variable id "identification number"

label variable sex "sex"

label variable birthmonth "birth month"

label variable birthyear "birth year"

label variable hhincome97 "gross household income in 1997"

label variable hhincomepovratio97 "household income to poverty ratio in 1997"

label variable headofhousehold97 "relationship to head of household in 1997"

label variable hhsize97 "household size in 1997"

label variable sampletype "sample type original or supplemental"

label variable raceethnicity "race/ethnicity"

label variable hhincome98 "gross household income in 1998"

label variable hhincomepovratio98 "household income to poverty ratio in 1998"

label variable hhincome99 "gross household income in 1999"

label variable hhincomepovratio99 "household income to poverty ratio in 1999" 

label variable totaladvmathcredits "total number of Carnegie advanced mathematics credits"

label variable income2017 "total income from wages and salary in 2017"

label variable income2019 "total income from wages and salary in 2019"

label variable satmathscore "highest SAT math score recorded"

label variable totalmathcreditsreq "total mathematics credits required for high school diploma"

*drop cases with missing gross household income data for 1997, 1998, and 1999
keep if hhincome97 >= 0| hhincome98 >= 0| hhincome99 >= 0

*drop cases with missing household income to poverty ratio data for 1997, 1998, and 1999
keep if hhincomepovratio97 >= 0| hhincomepovratio98 >= 0| hhincomepovratio99 >= 0

*drop cases with missing total mathematics credits required for high school diploma data
keep if totalmathcreditsreq >= 0

*drop cases with missing total income from wages and salaries data from 2017 and 2019
keep if income2017 >= 0| income2019 >= 0

*drop cases if they only took pre-hs advanced math, have invalid Carnegie credits, or took courses but their credits are missing  
drop if totaladvmathcredits == -8| totaladvmathcredits == -6

*drop cases if they're missing an SAT Math score
drop if satmathscore < 0 

*generate mathematics credits variables that we can interpret by dividing by 100
generate totalmathcreditsgraduate = totalmathcreditsreq / 100

generate advmathcreditsearned = totaladvmathcredits / 100

replace advmathcreditsearned = 0 if advmathcreditsearned < 0 

*label new mathematics credits variables
label variable totalmathcreditsgraduate "total mathematics credits required by state"

label variable advmathcreditsearned "total advanced mathematics credits earned"

*create dummy for female
generate female = 0

replace female = 1 if sex == 2

*create dummy for both biological parents
generate bothbioparents = 0

replace bothbioparents = 1 if headofhousehold97 == 1

*create dummy for white
generate white = 0

replace white = 1 if raceethnicity == 4

*label newly generated dummies
label variable female "dummy for female"

label variable bothbioparents "dummy for both biological parents in the household"

label variable white "dummy for white"

*replace "did not take course" values with zero values
replace totaladvmathcredits = 0 if totaladvmathcredits < 0

*replace missing hhincome97, hhincome98, and hhincome99 values as missing
replace hhincome97 = . if hhincome97 < 0

replace hhincome98 = . if hhincome98 < 0

replace hhincome99 = . if hhincome99 < 0 

*generate realhhincome97, realhhincome98, and realhhincome99 variables in 1997 dollars
generate realhhincome97 = hhincome97/(160.5/160.5)

generate realhhincome98 = hhincome98/(160.5/163)

generate realhhincome99 = hhincome99/(160.5/166.6)

*label realhhincome97, realhhincome98, and realhhincome99 variables 
label variable realhhincome97 "1997 household income in 1997 dollars"

label variable realhhincome98 "1998 household income in 1997 dollars"

label variable realhhincome99 "1999 household income in 1997 dollars"

*generate average of non missing household income for 97, 98, and 99
egen avginc9799 = rowmean (realhhincome97 realhhincome98 realhhincome99)

*label avginc9799 variable
label variable avginc9799 "average of non missing values of 1997, 1998, and 1999 household income in 1997 dollars"

*generate percentile rank of average of non missing household income for 97, 98, and 99
egen n = count (avginc9799)

egen i = rank (avginc9799), track

gen householdincomerank = ((i-1) / (n-1)) * 100 

drop n i 

*label householdincomerank variable
label variable householdincomerank "percentile rank of average of households 1997, 1998, and 1999 income"

*replace missing household income to poverty ratio values as missing
replace hhincomepovratio97 = . if hhincomepovratio97 < 0

replace hhincomepovratio98 = . if hhincomepovratio98 < 0

replace hhincomepovratio99 = . if hhincomepovratio99 < 0

*generate average of non missing income to poverty ratios for 97-99
egen avgincomepovratio9799 = rowmean (hhincomepovratio97 hhincomepovratio98 hhincomepovratio99)

generate averageincomepovratio9799 = avgincomepovratio9799 / 100

*label avgincomepovratio9799 
label variable avgincomepovratio9799 "average of non missing household income to poverty ratios for 1997, 1998, and 1999"

*label averageincomepovratio9799 
label variable averageincomepovratio9799 "average of 97-99 household income to poverty ratios"

*replace missing income2017 and income2019 values as missing
replace income2017 = . if income2017 < 0

replace income2019 = . if income2019 < 0

*generate real income for 2017 and 2019 in 2019 dollars
generate realincome2017 = income2017/(255.7/245.1)

generate realincome2019 = income2019/(255.7/255.7)

*label realincome2017 and realincome2019 variables
label variable realincome2017 "2017 income from salary and wages in 2019 dollars" 

label variable realincome2019 "2019 income from salary and wages in 2019 dollars"

*generate average of non missing real income for 2017 and 2019
egen avginc20172019 = rowmean (realincome2017 realincome2019)

*label avginc20172019 variable
label variable avginc20172019 "average of 2017 and 2019 income from salary and wages in 2019 dollars"

*generate log of real average income for 2017 and 2019
gen logavginc = log(avginc20172019)

*label logavginc variable
label variable logavginc "log of average of 2017 and 2019 income from salary and wages"
 
*create age in years at beginning of the study variable
generate age = 1996-birthyear

*label age variable 
label variable age "age in years at the beginning of the study"

*create cohort variable
generate cohort = birthyear+14

*label cohort variable 
label variable cohort "high school cohort"

*save datafile
save "SATMathIncRankQuantControlsDepVars.dta"

log close  





