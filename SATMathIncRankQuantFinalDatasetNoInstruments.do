*=====================================================================================================================================================================
*Date: January 2022 --> Latest Update: August 2022
*Paper: SAT Math Credits and Income Rank, Quantile, and Mobility
*
*This code changes the high school state variable to a 1-51 state system and creates a years of exposure to STEM reform variable. 
*
*database used: SATMathIncRankQuantVarsLocation.dta
*
*output: SATMathIncRankQuantFinalDatasetNoInstruments.dta
*
*key variables: - high school state 
*				- years of exposure to STEM reform 
*=====================================================================================================================================================================

clear 

clear matrix 

log using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\logfiles\SATMathIncRankQuantFinalDatasetNoInstruments.smcl"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles"
cd $PATH

*Use the dissertation data with controls and dependent variables created
use "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles\SATMathIncRankQuantVarsLocation.dta"

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

*create exposurestemreform variable 
generate exposurestemreform = 0

*label exposurestemreform variable
label variable exposurestemreform "years of exposure to STEM reform"

*STEM reform is from 2001-2016 for state 1
replace exposurestemreform = 1 if highschoolstate == 1 & cohort == 1998

*There is no STEM reform in state 2

*STEM reform is from 2011-3014 for state 3

*STEM reform is from 1994-2014 for state 4
replace exposurestemreform = 4 if highschoolstate == 4

*STEM reform is from 1983-2016 for state 5
replace exposurestemreform = 4 if highschoolstate == 5

*STEM reform is from 2001-2008 for state 6
replace exposurestemreform = 1 if highschoolstate == 6 & cohort == 1998

*STEM reform is from 1983-2014 for state 7
replace exposurestemreform = 4 if highschoolstate == 7 

*STEM reform is from 1984-2016 for state 8
replace exposurestemreform = 4 if highschoolstate == 8

*There is no STEM reform in state 9

*STEM reform is from 1991-2014 for state 10
replace exposurestemreform = 4 if highschoolstate == 10

*STEM reform is from 1995-2011 for state 11
replace exposurestemreform = 3 if highschoolstate == 11 & cohort == 1994

replace exposurestemreform = 4 if highschoolstate == 11 & cohort > 1994

*STEM reform is from 2002-2004 for state 12

*STEM reform is from 1992-1993 for state 13

*STEM reform is from 1986-2016 for state 14
replace exposurestemreform = 4 if highschoolstate == 14 

*STEM reform is from 1991-2014 for state 15
replace exposurestemreform = 4 if highschoolstate == 15

*STEM reform is from 2001-2016 for state 16
replace exposurestemreform = 1 if highschoolstate == 16 & cohort == 1998

*STEM reform is from 2005-2007 for state 17

*STEM reform is from 1991-2014 for state 18
replace exposurestemreform = 4 if highschoolstate == 18

*STEM reform is from 2003-2005 for state 19

*STEM reform is from 1998-2014 for state 20
replace exposurestemreform = 1 if highschoolstate == 20 & cohort == 1995

replace exposurestemreform = 2 if highschoolstate == 20 & cohort == 1996

replace exposurestemreform = 3 if highschoolstate == 20 & cohort == 1997

replace exposurestemreform = 4 if highschoolstate == 20 & cohort == 1998

*STEM reform is from 1991-2014 for state 21
replace exposurestemreform = 4 if highschoolstate == 21

*STEM reform is from 1999-2016 for state 22
replace exposurestemreform = 1 if highschoolstate == 22 & cohort == 1996

replace exposurestemreform = 2 if highschoolstate == 22 & cohort == 1997

replace exposurestemreform = 3 if highschoolstate == 22 & cohort == 1998

*There is no STEM reform in state 23

*There is no STEM reform in state 24

*STEM reform is from 1991-2016 for state 25
replace exposurestemreform = 4 if highschoolstate == 25

*STEM reform is from 2003-2015 for state 26

*STEM reform is from 2007-2016 for state 27

*STEM reform is from 2000-2012 for state 28
replace exposurestemreform = 1 if highschoolstate == 28 & cohort == 1997

replace exposurestemreform = 2 if highschoolstate == 28 & cohort == 1998

*There is no STEM reform in state 29

*There is no STEM reform in state 30

*There is no STEM reform in state 31

*STEM reform is from 1994-2016 for state 32
replace exposurestemreform = 3 if highschoolstate == 32 & cohort == 1994

replace exposurestemreform = 4 if highschoolstate == 32 & cohort > 1994

*STEM reform is from 2000-2016 for state 33
replace exposurestemreform = 1 if highschoolstate == 33 & cohort == 1997

replace exposurestemreform = 2 if highschoolstate == 33 & cohort == 1998

*STEM reform is from 2001-2014 for state 34
replace exposurestemreform = 1 if highschoolstate == 34 & cohort == 1998

*STEM reform is from 2001-2014 for state 35
replace exposurestemreform = 1 if highschoolstate == 35 & cohort == 1998

*STEM reform is from 2009-2016 for state 36

*STEM reform is from 1985-2016 for state 37
replace exposurestemreform = 4 if highschoolstate == 37

*There is no STEM reform in state 38

*STEM reform is from 1984-2008 for state 39
replace exposurestemreform = 4 if highschoolstate == 39

*There is no STEM reform in state 40

*STEM reform is from 1984-2016 for state 41
replace exposurestemreform = 4 if highschoolstate == 41

*STEM reform is from 2003-2016 for state 42

*STEM reform is from 1991-2014 for state 43
replace exposurestemreform = 4 if highschoolstate == 43

*STEM reform is from 2001-2016 for state 44
replace exposurestemreform = 1 if highschoolstate == 44 & cohort == 1998

*STEM reform is from 1996-2016 for state 45
replace exposurestemreform = 2 if highschoolstate == 45 & cohort == 1996

replace exposurestemreform = 3 if highschoolstate == 45 & cohort == 1997

replace exposurestemreform = 4 if highschoolstate == 46 & cohort == 1998

*There is no STEM reform in state 46

*STEM reform is from 2002-2014 for state 47

*STEM reform is from 1983-2014 for state 48
replace exposurestemreform = 4 if highschoolstate == 48

*STEM reform is from 1991-2014 for state 49
replace exposurestemreform = 4 if highschoolstate == 49

*STEM reform is from 1998-2014 for state 50
replace exposurestemreform = 1 if highschoolstate == 50 & cohort == 1995

replace exposurestemreform = 2 if highschoolstate == 50 & cohort == 1996

replace exposurestemreform = 3 if highschoolstate == 50 & cohort == 1997

replace exposurestemreform = 4 if highschoolstate == 50 & cohort == 1998

*STEM reform is from 1997-2015 for state 51
replace exposurestemreform = 1 if highschoolstate == 51 & cohort == 1994

replace exposurestemreform = 2 if highschoolstate == 51 & cohort == 1995

replace exposurestemreform = 3 if highschoolstate == 51 & cohort == 1996

replace exposurestemreform = 4 if highschoolstate == 51 & cohort > 1996   

save "SATMathIncRankQuantFinalDatasetNoInstruments.dta"

log close 














