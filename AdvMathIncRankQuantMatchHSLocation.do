*=====================================================================================================================================================================
*Date: January 2022 --> Latest Update: August 2022
*Paper: Advanced Math Credits and Income Rank, Quantile, and Mobility
*
*This code takes the location geocode data and drops every variable except id and 1997 location then merges the high school location with the dataset for the 
*dissertation.
*
*database used: Location_R18.csv, AdvMathIncRankQuantControlsDepVars.dta
*
*output: AdvMathIncRankQuantVarsLocation.dta
*
*key variables: - id
*				- 1997 state location 
*=====================================================================================================================================================================

clear 

clear matrix 

log using "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\logfiles\AdvMathIncRankQuantMatchHSLocation.smcl"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\dofiles_dtafiles"
cd $PATH

*import the location geocode data
import delimited "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\rawdata\Location_R18.csv"

*drop all other variables except id and location for ASVAB in 1997
keep r0000100 r1243000

*rename id variable
rename r0000100 id

*rename 1997 location variable
rename r1243000 highschoolstate

*label id variable
label variable id "identification number"

*label highschoolstate variable
label variable highschoolstate "state where high school was attended"

*save dataset with id and highschoolstate 
save "AdvMathIncRankQuantMatchHSLocation.dta"

*open the dissertation data with controls and dependent variables created
use "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\dofiles_dtafiles\AdvMathIncRankQuantControlsDepVars.dta"

*drop merge variable
drop _merge 

*merge datasets to add highschoolstate variable 
merge 1:1 id using "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\dofiles_dtafiles\AdvMathIncRankQuantMatchHSLocation.dta"

*drop non-matching cases
drop if cohort == .

*drop merge variable
drop _merge 

*save dataset with high school state variable 
save "AdvMathIncRankQuantVarsLocation.dta"

log close  












