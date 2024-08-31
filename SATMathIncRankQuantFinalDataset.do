*=====================================================================================================================================================================
*Date: August 2022 --> Latest Update: August 2022
*Paper: SAT Math Score and Income Percentile Rank, Quantile, and Mobility
*
*This code adds highest education achieved and parent 97 income from wages and salaries, then drops cases with zero values for avginc20172019 or avgparentinc97 and creates 
*incomerank and parentrank variables. Also transforms some variables for easier interpretation of coefficients from regression results. 
*
*database used: SATMathIncRankQuantFinalDatasetInstruments.dta
*				
*output: SATMathIncRankQuantFinalDatataset.smcl, SATMathIncRankQuantFinalDatataset.dta
*
*key variables: N/A
*							
*=====================================================================================================================================================================

clear

clear matrix

set mem 500m

log using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\logfiles\SATMathIncRankQuantFinalDataset.smcl"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles"
cd $PATH

*import dataset with additional variables
import delimited "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\rawdata\SATMathIncomeRankQuantileEducation.csv"

*rename,label, and keep id, parent one 97 income, parent two 97 inc, and education variables 
rename r0000100 id

label variable id "identification number"

rename r0609800 parentone97inc

label variable parentone97inc "parent one 97 income from wages and salary"

rename r0610500 parenttwo97inc

label variable parenttwo97inc "parent two 97 income from wages and salary"

rename z9083900 education

label variable education "highest level of education attained"

keep id parentone97inc parenttwo97inc education

*merge added variables with existing dataset
merge 1:m id using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles\SATMathIncRankQuantFinalDatasetInstruments.dta

*drop cases only on the master dataset
drop if _merge == 1 

*drop if missing values for avginc20172019 
drop if avginc20172019 == .

*drop if 0 values for avginc20172019, avginc9799,  or education
drop if avginc20172019 == 0| avginc9799 == 0| avgincomepovratio9799 == 0| education < 0

*create percentile rank variables for parent and child income then label variables 
egen n = count (avginc20172019)

egen i = rank (avginc20172019), track

gen incomerank = ((i-1) / (n-1)) * 100 

drop n i 

label variable incomerank "percentile rank of average of 2017 and 2019 income from salary and wages"

*create dummy variables for education levels
generate hsdiploma = 0

replace hsdiploma = 1 if education == 2

generate belowbachelors = 0

replace belowbachelors = 1 if education == 3

generate bachelorsabove = 0

replace bachelorsabove = 1 if education > = 4

summarize hsdiploma belowbachelors bachelorsabove 

summarize education if hsdiploma == 0 & belowbachelors == 0 & bachelorsabove == 0

*transform total state expenditures on STEM reform, total recipients of STEM reform and average household income from 97-99 variables for better interpretation of coefficients
generate expend2 = expend/1000000

generate rec2 = rec/1000

generate avginc9799thou = avginc9799/1000

*drop if zero value for incomerank
drop if incomerank == 0

*save final dataset
save "SATMathIncRankQuantFinalDataset.dta"




