*=====================================================================================================================================================================
*Date: January 2022 --> Latest Update: August 2022
*Paper: Advanced Math Credits and Income Rank, Quantile, and Mobility
*
*This code changes the high school state variable to a 1-51 state system and creates a years of exposure to STEM reform variable. 
*
*database used: AdvMathIncRankQuantVarsLocation.dta
*
*output: AdvMathIncRankQuantFinalDatasetNoInstruments.dta
*
*key variables: - high school state 
*				- years of exposure to STEM reform 
*=====================================================================================================================================================================

clear 

clear matrix 

log using "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\logfiles\AdvMathIncRankQuantFinalDatasetNoInstruments.smcl"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\dofiles_dtafiles"
cd $PATH

*Use the dissertation data with controls and dependent variables created
use "C:\Users\jcoger\Documents\Essay1\AdvMathWork\AdvMathIncomeRankQuantileV1\dofiles_dtafiles\AdvMathIncRankQuantVarsLocation.dta"

*change highschoolstate variable to a 1-51 system (AL-WY) 
replace highschoolstate = 3 if highschoolstate == 4

replace highschoolstate = 4 if highschoolstate == 5

replace highschoolstate = 5 if highschoolstate == 6

replace highschoolstate = 6 if highschoolstate == 8

replace highschoolstate = 7 if highschoolstate == 9

replace highschoolstate = 8 if highschoolstate == 10

replace highschoolstate = 9 if highschoolstate == 11

replace highschoolstate = 10 if highschoolstate == 12

replace highschoolstate = 11 if highschoolstate == 13

replace highschoolstate = 12 if highschoolstate == 15

replace highschoolstate = 13 if highschoolstate == 16

replace highschoolstate = 14 if highschoolstate == 17

replace highschoolstate = 15 if highschoolstate == 18

replace highschoolstate = 16 if highschoolstate == 19

replace highschoolstate = 17 if highschoolstate == 20

replace highschoolstate = 18 if highschoolstate == 21

replace highschoolstate = 19 if highschoolstate == 22

replace highschoolstate = 20 if highschoolstate == 23

replace highschoolstate = 21 if highschoolstate == 24

replace highschoolstate = 22 if highschoolstate == 25

replace highschoolstate = 23 if highschoolstate == 26

replace highschoolstate = 24 if highschoolstate == 27

replace highschoolstate = 25 if highschoolstate == 28

replace highschoolstate = 26 if highschoolstate == 29

replace highschoolstate = 27 if highschoolstate == 30

replace highschoolstate = 28 if highschoolstate == 31

replace highschoolstate = 29 if highschoolstate == 32

replace highschoolstate = 30 if highschoolstate == 33

replace highschoolstate = 31 if highschoolstate == 34

replace highschoolstate = 32 if highschoolstate == 35

replace highschoolstate = 33 if highschoolstate == 36

replace highschoolstate = 34 if highschoolstate == 37

replace highschoolstate = 35 if highschoolstate == 38

replace highschoolstate = 36 if highschoolstate == 39

replace highschoolstate = 37 if highschoolstate == 40

replace highschoolstate = 38 if highschoolstate == 41

replace highschoolstate = 39 if highschoolstate == 42

replace highschoolstate = 40 if highschoolstate == 44

replace highschoolstate = 41 if highschoolstate == 45

replace highschoolstate = 42 if highschoolstate == 46

replace highschoolstate = 43 if highschoolstate == 47

replace highschoolstate = 44 if highschoolstate == 48

replace highschoolstate = 45 if highschoolstate == 49

replace highschoolstate = 46 if highschoolstate == 50

replace highschoolstate = 47 if highschoolstate == 51

replace highschoolstate = 48 if highschoolstate == 53

replace highschoolstate = 49 if highschoolstate == 54

replace highschoolstate = 50 if highschoolstate == 55

replace highschoolstate = 51 if highschoolstate == 56

save "AdvMathIncRankQuantFinalDatasetNoInstruments.dta"

log close 














