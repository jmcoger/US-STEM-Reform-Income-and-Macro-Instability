*=====================================================================================================================================================================
*Date: February 2022 --> Latest Update: February 2022
*Paper: Advanced Math Credits and Income Percentile Rank, Quantile, and Mobility
*
*This code uses the pdslasso command to identify the appropriate independent variables for our income rank regressions and income quantile regression analyses  
*
*database used: AdvMathIncRankQuantFinalDatasetInstruments.dta
*				
*output: AdvMathIncRankQuantAnalysis.smcl
*
*key variables: -income percentile rank
*               -advanced mathematics credits earned
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

log using "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\logfiles\AdvMathIncRankQuantAnalysis.smcl"

use "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\dofiles_dtafiles\AdvMathIncRankQuantFinalDataset.dta"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\tables"
cd $PATH

*install pdslasso package
ssc install pdslasso 

*install lassopack package
ssc install lassopack 

*install qreg2 package
ssc install qreg2

***OLS with variable selection using lasso***

*Run pdslasso command to determine appropriate controls and estimate for the coefficient of our dependent variable with exposure to STEM reform partialled out
pdslasso incomerank advmathcreditsearned (exp hsdiploma belowbachelors bachelorsabove hhsize97 female bothbioparents white avginc9799 averageincomepovratio9799 age totalmathcreditsgraduate c*), partial(c* hsdiploma belowbachelors bachelorsabove exp) cluster (highschoolstate) rlasso

*female, bothbioparents, white, avginc9799thou, and averageincomepovratio9799 selected as independent variables

*Run regression with controls selected by lasso
regress incomerank advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 c* s* exp, robust cluster (highschoolstate)

estadd local fe Yes

*Store regression estimates
est sto m1

*Run regression with controls selected by lasso using total recipients of STEM reform as our measure of exposure to STEM reform
regress incomerank advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 c* s* rec2, robust cluster (highschoolstate)

estadd local fe Yes

*Store regression estimates
est sto m2

*Run regression with controls selected by lasso using total state expenditures on STEM reform as our measure of exposure to STEM reform 
regress incomerank advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 c* s* expend2, robust cluster (highschoolstate)

estadd local fe Yes

*Store regression estimates
est sto m3

*Save results from three OLS models as table 
esttab m1 m2 m3 using AdvMathIncRankOLS.tex, keep (advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp rec2 expend2) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("OLS Regressions Income Rank Different Exposure STEM Reform") mtitles("Model 1" "Model 2" "Model 3")

***Quantile regression analysis***

*Determine controls necessary for quantile regression with exposure to STEM reform partialled out
pdslasso avginc20172019 advmathcreditsearned (exp hsdiploma belowbachelors bachelorsabove hhsize97 female bothbioparents white avginc9799 averageincomepovratio9799 age totalmathcreditsgraduate c*), partial(c* hsdiploma belowbachelors bachelorsabove exp) cluster (highschoolstate) rlasso

*bachelorabove, female, bothbioparents, white, avginc9799, and averageinomcepovratio9799 selected as controls by the lasso

*Run quantile regression at each quantile with controls determined by the lasso methods to examine advmathcreditsearned coefficient with exposure to STEM reform and save output tables
qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.25)

estadd local fe Yes

est sto m4
 
qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.5)

estadd local fe Yes

est sto m5

qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.75)

estadd local fe Yes

est sto m6

esttab m4 m5 m6 using AdvMathIncQuantExp.tex, keep (advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("Quantile Regression Income w/ Exposure") mtitles("25th" "50th" "75th")

*Run quantile regression at each quantile with controls determined by the lasso methods to examine advmathcreditsearned coefficient with total recipients of STEM reform instead of exposure to STEM reform and save output tables
qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.25)

estadd local fe Yes

est sto m7
 
qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.5)

estadd local fe Yes

est sto m8

qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.75)

estadd local fe Yes

est sto m9

esttab m7 m8 m9 using AdvMathIncQuantRec.tex, keep (advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2) cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE" "R^2")) legend nolabel nonumber title("Quantile Regression Income w/ Recipients") mtitles("25th" "50th" "75th")

*Run quantile regression at each quantile with controls determined by the lasso methods to examine advmathcreditsearned coefficient with total expenditures on STEM reform instead of exposure to STEM reform and save output tables
qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.25)

estadd local fe Yes

est sto m10
 
qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.5)

estadd local fe Yes

est sto m11

qreg2 avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, cluster(highschoolstate) quantile(.75)

estadd local fe Yes

est sto m12

esttab m10 m11 m12 using AdvMathIncQuantExpend.tex, keep (advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2)  cells(b(star fmt(3)) se(fmt(3) par)) starlevels(* .1 ** .05 *** .01 **** .001) stats(fe r2 N, ///
labels("state and cohort FE""R^2")) legend nolabel nonumber title("Quantile Regression Income w/ Expenditures") mtitles("25th" "50th" "75th")

*Simultaneous quantile regression and hypothesis tests for whether advmathcreditsearned effects are the same across quantiles, compute confidence interval if difference is statistically significant

*exposure as STEM reform variable
sqreg avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 exp i.hscohort i.highschoolstate, q(.25 .5 .75)

test [q25]advmathcreditsearned = [q75]advmathcreditsearned

lincom [q75]advmathcreditsearned -[q25]advmathcreditsearned

test [q25]advmathcreditsearned = [q50]advmathcreditsearned

test [q50]advmathcreditsearned = [q75]advmathcreditsearned

*recipients as STEM reform variable
sqreg avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 rec2 i.hscohort i.highschoolstate, q(.25 .5 .75)

test [q25]advmathcreditsearned = [q75]advmathcreditsearned

lincom [q75]advmathcreditsearned -[q25]advmathcreditsearned

test [q25]advmathcreditsearned = [q50]advmathcreditsearned

lincom [q50]advmathcreditsearned -[q25]advmathcreditsearned

test [q50]advmathcreditsearned = [q75]advmathcreditsearned

lincom [q75]advmathcreditsearned -[q50]advmathcreditsearned


*expenditures as STEM reform variable
sqreg avginc20172019 advmathcreditsearned hsdiploma belowbachelors bachelorsabove female bothbioparents white avginc9799thou averageincomepovratio9799 expend2 i.hscohort i.highschoolstate, q(.25 .5 .75)

test [q25]advmathcreditsearned = [q75]advmathcreditsearned

lincom [q75]advmathcreditsearned -[q25]advmathcreditsearned

test [q25]advmathcreditsearned = [q50]advmathcreditsearned

lincom [q50]advmathcreditsearned -[q25]advmathcreditsearned

test [q50]advmathcreditsearned = [q75]advmathcreditsearned

lincom [q75]advmathcreditsearned -[q50]advmathcreditsearned

log close









  
  




