*=====================================================================================================================================================================
*Date: January 2022 --> Latest Update: August 2022
*Paper: SAT Mathematics Scores and Income Percentile Rank, Quantile, and Mobility
*
*This code creates summary statistics for our dependent and independent variables then generates descriptive statistics tables for LaTeX.
*
*database used: SATMathIncRankQuantFinalDatasetNoInstruments.dta
*				
*output: SATMathIncRankControlDescriptives.tex, SATMathIncRankTreatmentOutcomeDescriptives.tex
*
*key variables: -sex
*				-race/ethnicity
*				-birth month
*				-birth year
*				-highest SAT math score
*				-gross household income between 1996 and 1999
*				-household income to poverty ratio 1996 to 1999
*				-household size in 1997
*				-relationship to adults in household (both biological parents or not)
*				-average of labor income in 2017 and 2019
*				-income percentile rank
*							
*=====================================================================================================================================================================

clear

clear matrix

set mem 500m

log using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\logfiles\SATMathIncRankQuantDescriptives.smcl"

*install estout package
ssc install estout, replace

which estout  // check versions

which esttab

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\tables"
cd $PATH

*open final dataset with instruments 
use "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles\SATMathIncRankQuantFinalDataset.dta"

*drop if incomerank equals 0
drop if incomerank == 0| averageincomepovratio9799 == 0| avginc9799 == 0

*create table ouput for independent and dependent variables 
tabstat female white bothbioparents hsdiploma belowbachelors bachelorsabove age avginc9799 averageincomepovratio9799 totalmathcreditsgraduate satmathscore exp rec expend hhsize97 advmathcreditsearned avginc20172019 incomerank, c(stat) stat(mean sd count)

ereturn list

est clear  // clear the est locals

estpost tabstat female white bothbioparents hsdiploma belowbachelors bachelorsabove age avginc9799 averageincomepovratio9799 totalmathcreditsgraduate satmathscore exp rec expend hhsize97 advmathcreditsearned avginc20172019 incomerank, c(stat) stat(mean sd count)

esttab, ///
 cells("mean(fmt(%13.2fc)) sd(fmt(%13.2fc)) count") nonumber ///
  nomtitle nonote noobs collabels("Mean" "SD" "N")

*export table as LaTeX file
esttab using "./SATMathIncRankDescriptives.tex", replace ////
 cells("mean(fmt(%13.2fc)) sd(fmt(%13.2fc)) count") nonumber ///
  nomtitle nonote noobs booktabs f ///
  collabels("Mean" "SD" "N")
  
log close







