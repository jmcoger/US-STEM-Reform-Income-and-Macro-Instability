*=====================================================================================================================================================================
*Date: February 2022 --> Latest Update: February 2022
*Paper: SAT Math Scores and Income Percentile Rank, Quantile, and Mobility
*
*This code uses the pdslasso command to identify the appropriate independent variables for our income rank regressions and income quantile regression analyses  
*
*database used: SATMathIncRankQuantFinalDatasetInstruments.dta
*				
*output: SATMathIncRankQuantAnalysis.smcl
*
*key variables: -income percentile rank
*               -SAT mathematics scores
*               -exposure to STEM reform
*               -dummy for white
*               -dummy for female 
*               -cohort fixed effects
*               -high school state for clustered robust st. errors
*               -total math credits required to earn a high school diploma
*
*							
*=====================================================================================================================================================================

clear 

clear matrix 

log using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\logfiles\SATMathIncRankQuantAnalysis.smcl"

use "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles\SATMathIncRankQuantFinalDataset.dta"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\tables"
cd $PATH

*install pdslasso package
ssc install pdslasso 

*install lassopack package
ssc install lassopack 

*install qreg2 package
ssc install qreg2

***Determine controls with instrument for regression using lasso estimator then use OLS to get estimate for effect of satmathscore on incomerank***

*Run pdslasso command to determine appropriate controls for estimating the coefficient of our independent variable with exposure to STEM reform partialled out
pdslasso incomerank satmathscore (exp advmathcreditsearned hsdiploma belowbachelors bachelorsabove hhsize97 female bothbioparents white avginc9799 averageincomepovratio9799 age totalmathcreditsgraduate c*), partial(c* exp hsdiploma belowbachelors bachelorsabove) cluster (highschoolstate) rlasso

*advmathcreditsearned, female, white, avginc9799, averageincomepovratio9799 selected with lasso

*Run OLS with lasso selected controls 
regress incomerank satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, robust cluster (highschoolstate)

estadd local fe Yes

*Store results from regression 
est sto m1

*Run OLS with with lasso selected controls 
regress incomerank satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, robust cluster (highschoolstate)

estadd local fe Yes

*Store results from regression
est sto m2


*Run OLS with lasso selected controls
regress incomerank satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, robust cluster (highschoolstate)

estadd local fe Yes

*Store results from regression 
est sto m3

*Save results from three OLS models as table 
esttab m1 m2 m3 using SATMathIncRankOLS.tex, keep (satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp rec2 expend2) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("OLS Regressions Income Rank Different Exposure STEM Reform") mtitle("Model 1" "Model 2" "Model 3")

***Quantile regression analysis***

*Determine controls necessary for quantile regression analysis with exposure to STEM reform
pdslasso avginc20172019 satmathscore (exp advmathcreditsearned hsdiploma belowbachelors bachelorsabove hhsize97 female bothbioparents white avginc9799 averageincomepovratio9799 age totalmathcreditsgraduate c*), partial(c* exp hsdiploma belowbachelors bachelorsabove) cluster (highschoolstate) rlasso

*advmathcreditsearned, female, white, avginc9799, averageincomepovratio9799 selected using lasso

*Run quantile regression at each quantile with controls determined by the lasso to examine satmathscore coefficient with exposure to STEM reform and save output tables
qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.25)

estadd local fe Yes

est sto m4
 
qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.50)

estadd local fe Yes

est sto m5

qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.75)

estadd local fe Yes

est sto m6

esttab m4 m5 m6 using SATMathIncRankQuantExp.tex, keep (satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("Quantile Regression Income w/ Exposure") mtitles("25th" "50th" "75th")

*Run quantile regression at each quantile with controls determined by the lasso methods to examine satmathscore coefficient with total recipients of STEM reform instead of exposure to STEM reform and save output tables
qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.25)

estadd local fe Yes

est sto m7
 
qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.50)

estadd local fe Yes

est sto m8

qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.75)

estadd local fe Yes

est sto m9

esttab m7 m8 m9 using SATMathIncRankQuantRec.tex, keep (satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("Quantile Regression Income w/ Recipients") mtitles("25th" "50th" "75th")

*Run quantile regression at each quantile with controls determined by the lasso methods to examine satmathscore coefficient with total expenditures on STEM reform instead of exposure to STEM reform and save output tables
qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.25)

estadd local fe Yes

est sto m10
 
qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.50)


estadd local fe Yes

est sto m11

qreg2 avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.75)


estadd local fe Yes

est sto m12

esttab m10 m11 m12 using SATMathIncRankQuantExpend.tex, keep (satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, /// 
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("Quantile Regression Income w/ Expenditures") mtitles("25th" "50th" "75th")

*Simultaneous quantile regression and hypothesis tests for whether advmathcreditsearned effects are the same across quantiles, compute confidence interval if difference is statistically significant

*exposure as STEM reform variable
sqreg avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, q(.25 .5 .75)

test [q25]advmathcreditsearned = [q75]advmathcreditsearned

test [q25]advmathcreditsearned = [q50]advmathcreditsearned

test [q50]advmathcreditsearned = [q75]advmathcreditsearned

*recipients as STEM reform variable
sqreg avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, q(.25 .5 .75)

test [q25]advmathcreditsearned = [q75]advmathcreditsearned

test [q25]advmathcreditsearned = [q50]advmathcreditsearned

test [q50]advmathcreditsearned = [q75]advmathcreditsearned

*expenditures as STEM reform variable
sqreg avginc20172019 satmathscore advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, q(.25 .5 .75)

test [q25]advmathcreditsearned = [q75]advmathcreditsearned

test [q25]advmathcreditsearned = [q50]advmathcreditsearned

test [q50]advmathcreditsearned = [q75]advmathcreditsearned

log close








  
  




