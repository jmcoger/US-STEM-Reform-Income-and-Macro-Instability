*=====================================================================================================================================================================
*Date: February 2022 --> Latest Update: August 2022
*Paper: SAT Math Scores and Income Percentile Rank, Quantile, and Mobility
*
*This code creates the matrices necessary for our instruments by state, creates instruments for each respondent, and creates dummy variables for state and cohort fixed
*effects.   
*
*database used: STEM_Programs_State_Level.dta, SATMathIncRankQuantFinalDatasetNoInstruments.dta
*				
*output: SATMathIncRankQuantFinalDatatasetInstruments.smcl, SATMathIncRankQuantFinalDatatasetInstruments.dta
*
*key variables: N/A
*							
*=====================================================================================================================================================================

clear

clear matrix

set mem 500m

log using "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\logfiles\SATMathIncRankQuantFinalDatasetInstruments.smcl"

*Define the directory
global PATH "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles"
cd $PATH

use "C:\Users\jcoger\Documents\Essay1\SATMathWork\SATMathIncomeRankQuantileV1\dofiles_dtafiles\SATMathIncRankQuantFinalDatasetNoInstruments.dta"

*Create matrices for each cohorts enrollment from 1983-2016
matrix ninetyfour = (0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ninetyfour

matrix ninetyfive = (0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ninetyfive

matrix ninetysix = (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ninetysix

matrix ninetyseven = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ninetyseven

matrix ninetyeight = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ninetyeight

*create instruments by state and cohort

*AL

matrix AL = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list AL

matrix ALrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100,100,100,100,100,100,100,176.25,176.25,176.25,176.25,176.25,100,100,100,100)

matrix list ALrec

matrix ALexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,508000,508000,508000,508000,508000,508000,508000,846651.75,846651.75,846651.75,846651.75,846651.75,508000,508000,508000,508000)

matrix list ALexp

*AK

matrix AK = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list AK

matrix AKrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list AKrec

matrix AKexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list AKexp

*AZ 

matrix AZ = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0)

matrix list AZ

matrix AZrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,36,36,36,36,0,0)

matrix list AZrec

matrix AZexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,193676.73,193676.73,193676.73,193676.73,0,0)

matrix list AZexp

*AR

matrix AR = (0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list AR

matrix ARrec = (0,0,0,0,0,0,0,0,0,0,0,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,60.7647058823529,378.514705882353,378.514705882353,378.514705882353,378.514705882353,378.514705882353,826.514705882353,826.514705882353,826.514705882353,826.514705882353,448,448,0,0)

matrix list ARrec

matrix ARexp = (0,0,0,0,0,0,0,0,0,0,0,337577.926470588,337577.926470588,337577.926470588,337577.926470588,337577.926470588,337577.926470588,337577.926470588,337577.926470588,337577.926470588,337577.926470588,1724092.87272059,1724092.87272059,1724092.87272059,1724092.87272059,1724092.87272059,3104066.48872059,3104066.48872059,3104066.48872059,3104066.48872059,1379973.616,1379973.616,0,0)

matrix list ARexp

*CA

matrix CA = (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list CA

matrix CArec = (4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788,4788)

matrix list CArec

matrix CAexp = (16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672,16591672)

matrix list CAexp

*CO

matrix CO = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0)

matrix list CO

matrix COrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,248,248,248,248,248,248,248,248,0,0,0,0,0,0,0,0)

matrix list COrec 

matrix COexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,443040,443040,443040,443040,443040,443040,443040,443040,0,0,0,0,0,0,0,0)

matrix list COexp 

*CT 

matrix CT = (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list CT

matrix CTrec = (300,300,300,300,300,300,300,300,0,0,0,0,0,0,0,0,0,0,0,83,83,83,83,83,83,83,83,83,83,83,83,83,0,0)

matrix list CTrec

matrix CTexp = (2712000,2712000,2712000,2712000,2712000,2712000,2712000,2712000,0,0,0,0,0,0,0,0,0,0,0,347283,347283,347283,347283,347283,347283,347283,347283,347283,347283,347283,347283,347283,0,0)

matrix list CTexp

*DE

matrix DE = (0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list DE

matrix DErec = (0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,34,34,34,34,34,34,34,34,34,34,34,34,8,8)

matrix list DErec

matrix DEexp = (0,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,216000,395875,395875,395875,395875,395875,395875,395875,395875,395875,395875,395875,395875,216000,216000)

matrix list DEexp

*DC

matrix DC = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list DC

matrix DCrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list DCrec

matrix DCexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list DEexp

*FL

matrix FL = (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list FL

matrix FLrec = (0,0,0,0,0,0,0,0,867,867,2538,2538,2538,2538,2538,2538,2538,2538,2538,3109,3109,3109,3109,3109,3109,3109,3109,3109,571,571,571,571,0,0)

matrix list FLrec

matrix FLexp = (0,0,0,0,0,0,0,0,203447,203447,2638548,2638548,2638548,2638548,2638548,2638548,2638548,2638548,2638548,4580539,4580539,4580539,4580539,4580539,4580539,4580539,4580539,4580539,1941991,1941991,1941991,1941991,0,0)

matrix list FLexp

*GA

matrix GA = (0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0)

matrix list GA

matrix GArec = (0,0,0,0,0,0,0,0,0,0,0,0,1931,1931,1931,1931,1931,1931,3551,3551,3551,3551,3551,3551,3551,3551,3551,3551,1931,0,0,0,0,0)

matrix list GArec

matrix GAexp = (0,0,0,0,0,0,0,0,0,0,0,0,5062142,5062142,5062142,5062142,5062142,5062142,9365375,9365375,9365375,9365375,9365375,9365375,9365375,9365375,9365375,9365375,5062142,0,0,0,0,0)

matrix list GAexp

*HI

matrix HI = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list HI

matrix HIrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,23,23,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list HIrec

matrix HIexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,119000,119000,119000,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list HIexp

*ID

matrix ID = (0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ID

matrix IDrec = (0,0,0,0,0,0,0,0,0,28,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list IDrec

matrix IDexp = (0,0,0,0,0,0,0,0,0,84864,84864,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list IDexp

*IL

matrix IL = (0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list IL 

matrix ILrec = (0,0,0,274,274,274,274,274,709,709,709,709,1115,1115,1115,1115,1115,1115,1115,1207,1207,1207,1207,1207,1207,1207,1207,1207,1207,1207,801,801,274,274)

matrix list ILrec

matrix ILexp = (0,0,0,2928217,2928217,2928217,2928217,2928217,5351653,5351653,5351653,5351653,8219266,8219266,8219266,8219266,8219266,8219266,8219266,8652812,8652812,8652812,8652812,8652812,8652812,8652812,8652812,8652812,8652812,8652812,5785199,5785199,2928217,2928217)

matrix list ILexp

*IN

matrix IN = (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list IN

matrix INrec = (0,0,0,0,0,0,0,0,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214,0,0)

matrix list INrec

matrix INexp = (0,0,0,0,0,0,0,0,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,317478,0,0)

matrix list INexp

*IA

matrix IA = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list IA

matrix IArec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,290,314,314,314,314,314,314,314,314,314,314,314,314,639,325,325)

matrix list IArec

matrix IAexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,949974,15649974,15649974,15649974,15649974,15649974,15649974,15649974,15649974,15649974,15649974,15649974,15649974,16884974,1235000,1235000)

matrix list IAexp 

*KS

matrix KS = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0)

matrix list KS

matrix KSrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,36,36,36,0,0,0,0,0,0,0,0,0)

matrix list KSrec

matrix KSexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,191500,191500,191500,0,0,0,0,0,0,0,0,0)

matrix list KSexp

*KY

matrix KY = (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list KY

matrix KYrec = (0,0,0,0,0,0,0,0,447,447,447,447,447,447,447,447,447,447,447,1550,1550,1550,1550,1550,1550,1550,1550,1550,1550,1550,1550,1550,0,0)

matrix list KYrec

matrix KYexp = (0,0,0,0,0,0,0,0,2040163,2040163,2040163,2040163,2040163,2040163,2040163,2040163,2040163,2040163,2040163,4623649,4623649,4623649,4623649,4623649,4623649,4623649,4623649,4623649,4623649,4623649,4623649,4623649,0,0)

matrix list KYexp

*LA

matrix LA = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0)

matrix list LA

matrix LArec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33,33,33,0,0,0,0,0,0,0,0,0,0,0)

matrix list LArec

matrix LAexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,244000,244000,244000,0,0,0,0,0,0,0,0,0,0,0)

matrix list LAexp

*ME

matrix ME = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list ME

matrix MErec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,340,340,340,340,340,340,340,340,340,340,340,340,340,340,340,340,340,0,0)

matrix list MErec

matrix MEexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,1099799,0,0)

matrix list MEexp

*MD

matrix MD = (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list MD

matrix MDrec = (0,0,0,0,0,0,0,0,94,94,94,94,94,94,94,94,94,94,94,94,433,433,433,433,433,433,433,433,339,339,339,339,0,0)

matrix list MDrec

matrix MDexp = (0,0,0,0,0,0,0,0,607751,607751,607751,607751,607751,607751,607751,607751,607751,607751,607751,607751,2027210,2027210,2027210,2027210,2027210,2027210,2027210,2027210,1419459,1419459,1419459,1419459,0,0)

matrix list MDexp

*MA

matrix MA = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list MA

matrix MArec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,807,807,807,807,807,807,807,807,807,807,807,807,807,807,807,807,807,807)

matrix list MArec

matrix MAexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656,6403656)

matrix list MAexp 

*MI

matrix MI = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list MI

matrix MIrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list MIrec

matrix MIexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list MIexp

*MN

matrix MN = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list MN

matrix MNrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list MNrec

matrix MNexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list MNexp

*MS

matrix MS = (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list MS

matrix MSrec = (0,0,0,0,0,0,0,0,2177,2177,2177,2177,2177,2177,2177,2426,2426,2426,2426,2426,2426,2426,2426,2432,2432,2432,2613,2613,2613,2613,2686,2686,79,73)

matrix list MSrec

matrix MSexp = (0,0,0,0,0,0,0,0,6682898,6682898,6682898,6682898,6682898,6682898,6682898,8955922,8955922,8955922,8955922,8955922,8955922,8955922,8955922,9023330,9023330,9023330,9540238,9540238,9540238,9540238,9713505,9713505,240675,173268)

matrix list MSexp 

*MO

matrix MO = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list MO

matrix MOrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,275,275,275,275,300,300,300,78,78,78,78,78,25,0)

matrix list MOrec

matrix MOexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,356598,356598,356598,356598,538598,538598,538598,293840,293840,293840,293840,293840,182000,0)

matrix list MOexp

*MT

matrix MT = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1)

matrix list MT

matrix MTrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,120,120,120,120,120,120,120,120,120,120)

matrix list MTrec

matrix MTexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,364000,364000,364000,364000,364000,364000,364000,364000,364000,364000)

matrix list MTexp

*NE

matrix NE = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0)

matrix list NE

matrix NErec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NErec

matrix NEexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3429000,3429000,3429000,3429000,3429000,3429000,3429000,3429000,3429000,3429000,3429000,3429000,3429000,0,0,0,0)

matrix list NEexp 

*NV

matrix NV = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NV

matrix NVrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NVrec

matrix NVexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NVexp

*NH 

matrix NH = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NH

matrix NHrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NHrec

matrix NHexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NHexp

*NJ

matrix NJ = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NJ

matrix NJrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NJrec

matrix NJexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list NJexp

*NM

matrix NM = (0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list NM

matrix NMrec = (0,0,0,0,0,0,0,0,0,0,0,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,40,40,40,40)

matrix list NMrec

matrix NMexp = (0,0,0,0,0,0,0,0,0,0,0,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,115550,144050,144050,144050,144050)

matrix list NMexp 

*NY

matrix NY = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list NY 

matrix NYrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12055,12055,12055,12055,12055,12055,12229,12229,12229,12229,12229,12229,12229,12229,12229,12055,12055)

matrix list NYrec

matrix NYexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44265501,44265501,44265501,44265501,44265501,44265501,45119421,45119421,45119421,45119421,45119421,45119421,45119421,45119421,45119421,44265501,44265501)

matrix list NYexp

*NC

matrix NC = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list NC

matrix NCrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1507,2477,3325,3325,2006,2014,2014,2014,2014,2006,2006,3791,3791,2877,0,0)

matrix list NCrec

matrix NCexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,183000,10907431,13921247,13921247,15989358,16123758,16123758,16123758,16123758,15989358,15989358,27345319,27345319,23900393,0,0)

matrix list NCexp

*ND

matrix ND = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list ND

matrix NDrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,285,285,285,285,285,285,285,285,285,285,285,285,285,285,0,0)

matrix list NDrec

matrix NDexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,298125,298125,298125,298125,298125,298125,298125,298125,298125,298125,298125,298125,298125,298125,0,0)

matrix list NDexp

*OH

matrix OH = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1)

matrix list OH

matrix OHrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list OHrec

matrix OHexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6825000,6825000,4200000,4200000,4200000,4200000,4200000,4200000)

matrix list OHexp 

*OK

matrix OK = (0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list OK

matrix OKrec = (0,0,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136)

matrix list OKrec

matrix OKexp = (0,0,116325,116325,116325,116325,116325,116325,116325,116325,116325,116325,116325,116325,116325,116325,116325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325,494325)

matrix list OKexp

*OR

matrix OR = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list OR

matrix ORrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ORrec

matrix ORexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list ORexp 

*PA

matrix PA = (0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0)

matrix list PA 

matrix PArec = (0,138,138,138,138,2168,2168,2168,2168,2168,2168,2168,2168,2168,2168,138,138,138,138,138,138,138,138,138,138,138,0,0,0,0,0,0,0,0)

matrix list PArec

matrix PAexp = (0,432630,432630,432630,432630,6576526,6576526,6576526,6576526,6576526,6576526,6576526,6576526,6576526,6576526,432630,432630,432630,432630,432630,432630,432630,432630,432630,432630,432630,0,0,0,0,0,0,0,0)

matrix list PAexp 

*RI

matrix RI = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list RI

matrix RIrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list RIrec

matrix RIexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list RIexp 

*SC

matrix SC = (0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list SC

matrix SCrec = (0,1130,1130,1130,1130,1130,1130,1130,1130,1130,1130,1130,1130,1130,1130,1130,1305,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405,1405)

matrix list SCrec

matrix SCexp = (0,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,5367500,6785000,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061,8651061)

matrix list SCexp 

*SD

matrix SD = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list SD

matrix SDrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,73,73,73,73,73,73,73,73,73,117,117,117,117)

matrix list SDrec 

matrix SDexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,434350,434350,434350,434350,434350,434350,434350,434350,434350,434350,1859350,1859350,1859350,1859350)

matrix list SDexp 

*TN

matrix TN = (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list TN

matrix TNrec = (0,0,0,0,0,0,0,0,98,98,98,98,98,98,98,98,98,98,274,274,274,274,274,274,293,293,293,293,293,293,293,293,0,0)

matrix list TNrec

matrix TNexp = (0,0,0,0,0,0,0,0,502387,502387,502387,502387,502387,502387,502387,502387,502387,502387,1252392,1252392,1252392,1252392,1252392,1252392,1290925,1290925,1290925,1290925,1290925,1290925,1290925,1290925,0,0)

matrix list TNexp 

*TX

matrix TX = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list TX

matrix TXrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,820,820,820,820,820,820,820,820,820,820,820,820,820,0,0)

matrix list TXrec 

matrix TXexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3899257,3899257,3899257,3899257,3899257,3899257,3899257,3899257,3899257,3899257,3899257,3899257,3899257,0,0)

matrix list TXexp 

*UT

matrix UT = (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list UT

matrix UTrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,419,419,419,419,419,465,465,465,465,465,465,465,465,465,465,465,465,465,465,46,46)

matrix list UTrec

matrix UTexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,1411229,1411229,1411229,1411229,1411229,2331229,2331229,2331229,2331229,2331229,2331229,2331229,8426077,8426077,8426077,8426077,8426077,8426077,8426077,7014848,7014848)

matrix list UTexp 

*VT

matrix VT = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list VT

matrix VTrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list VTrec

matrix VTexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

matrix list VTexp

*VA

matrix VA = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list VA

matrix VArec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,277,277,277,277,277,277,277,277,277,277,277,277,277,0,0)

matrix list VArec 

matrix VAexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,928490,928490,928490,928490,928490,928490,928490,928490,928490,928490,928490,928490,928490,0,0)

matrix list VAexp 

*WA 

matrix WA = (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list WA

matrix WArec = (0,0,0,0,0,0,0,0,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,0,0)

matrix list WArec 

matrix WAexp = (0,0,0,0,0,0,0,0,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,386308,0,0)

matrix list WAexp 

*WV

matrix WV = (0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list WV

matrix WVrec = (0,0,0,0,0,0,0,0,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,0,0)

matrix list WVrec

matrix WVexp = (0,0,0,0,0,0,0,0,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,269828,0,0)

matrix list WVexp 

*WI

matrix WI = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)

matrix list WI

matrix WIrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,0,0)

matrix list WIrec

matrix WIexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,244258,0,0)

matrix list WIexp 

*WY

matrix WY = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

matrix list WY

matrix WYrec = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,0)

matrix list WYrec

matrix WYexp = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,864000,0)

matrix list WYexp 


*****create instruments*****

generate exp = 0

generate rec = 0

generate expend = 0 

*AL|01-16:1

matrix al94 = ninetyfour * AL'

matrix alrec94 = ninetyfour * ALrec'

matrix alexp94 = ninetyfour * ALexp'


scalar AL94 = al94[1,1]

scalar ALrec94 = alrec94[1,1]

scalar ALexp94 = alexp94[1,1]


replace exp = AL94 if highschoolstate == 1 & cohort == 1994

replace rec = ALrec94 if highschoolstate == 1 & cohort == 1994

replace expend = ALexp94 if highschoolstate == 1 & cohort == 1994


matrix al95 = ninetyfive * AL'

matrix alrec95 = ninetyfive * ALrec'

matrix alexp95 = ninetyfive * ALexp'


scalar AL95 = al95[1,1]

scalar ALrec95 = alrec95[1,1]

scalar ALexp95 = alexp95[1,1]


replace exp = AL95 if highschoolstate == 1 & cohort == 1995

replace rec = ALrec95 if highschoolstate == 1 & cohort == 1995

replace expend = ALexp95 if highschoolstate == 1 & cohort == 1995


matrix al96 = ninetysix * AL'

matrix alrec96 = ninetysix * ALrec'

matrix alexp96 = ninetysix * ALexp'


scalar AL96 = al96[1,1]

scalar ALrec96 = alrec96[1,1]

scalar ALexp96 = alexp96[1,1]


replace exp = AL96 if highschoolstate == 1 & cohort == 1996

replace rec = ALrec96 if highschoolstate == 1 & cohort == 1996

replace expend = ALexp96 if highschoolstate == 1 & cohort == 1996


matrix al97 = ninetyseven * AL'

matrix alrec97 = ninetyseven * ALrec'

matrix alexp97 = ninetyseven * ALexp'


scalar AL97 = al97[1,1]

scalar ALrec97 = alrec97[1,1]

scalar ALexp97 = alexp97[1,1]


replace exp = AL97 if highschoolstate == 1 & cohort == 1997

replace rec = ALrec97 if highschoolstate == 1 & cohort == 1997

replace expend = ALexp97 if highschoolstate == 1 & cohort == 1997


matrix al98 = ninetyeight * AL'

matrix alrec98 = ninetyeight * ALrec'

matrix alexp98 = ninetyeight * ALexp'


scalar AL98 = al98[1,1]

scalar ALrec98 = alrec98[1,1]

scalar ALexp98 = alexp98[1,1]


replace exp = AL98 if highschoolstate == 1 & cohort == 1998

replace rec = ALrec98 if highschoolstate == 1 & cohort == 1998

replace expend = ALexp98 if highschoolstate == 1 & cohort == 1998

*AK|None:2

*AZ|11-14:3

matrix az94 = ninetyfour * AZ'

matrix azrec94 = ninetyfour * AZrec'

matrix azexp94 = ninetyfour * AZexp'


scalar AZ94 = az94[1,1]

scalar AZrec94 = azrec94[1,1]

scalar AZexp94 = azexp94[1,1]


replace exp = AZ94 if highschoolstate == 3 & cohort == 1994

replace rec = AZrec94 if highschoolstate == 3 & cohort == 1994

replace expend = AZexp94 if highschoolstate == 3 & cohort == 1994


matrix az95 = ninetyfive * AZ'

matrix azrec95 = ninetyfive * AZrec'

matrix azexp95 = ninetyfive * AZexp'


scalar AZ95 = az95[1,1]

scalar AZrec95 = azrec95[1,1]

scalar AZexp95 = azexp95[1,1]


replace exp = AZ95 if highschoolstate == 3 & cohort == 1995

replace rec = AZrec95 if highschoolstate == 3 & cohort == 1995

replace expend = AZexp95 if highschoolstate == 3 & cohort == 1995


matrix az96 = ninetysix * AZ'

matrix azrec96 = ninetysix * AZrec'

matrix azexp96 = ninetysix * AZexp'


scalar AZ96 = az96[1,1]

scalar AZrec96 = azrec96[1,1]

scalar AZexp96 = azexp96[1,1]


replace exp = AZ96 if highschoolstate == 3 & cohort == 1996

replace rec = AZrec96 if highschoolstate == 3 & cohort == 1996

replace expend = AZexp96 if highschoolstate == 3 & cohort == 1996


matrix az97 = ninetyseven * AZ'

matrix azrec97 = ninetyseven * AZrec'

matrix azexp97 = ninetyseven * AZexp'


scalar AZ97 = az97[1,1]

scalar AZrec97 = azrec97[1,1]

scalar AZexp97 = azexp97[1,1]


replace exp = AZ97 if highschoolstate == 3 & cohort == 1997

replace rec = AZrec97 if highschoolstate == 3 & cohort == 1997

replace expend = AZexp97 if highschoolstate == 3 & cohort == 1997


matrix az98 = ninetyeight * AZ'

matrix azrec98 = ninetyeight * AZrec'

matrix azexp98 = ninetyeight * AZexp'


scalar AZ98 = az98[1,1]

scalar AZrec98 = azrec98[1,1]

scalar AZexp98 = azexp98[1,1]


replace exp = AZ98 if highschoolstate == 3 & cohort == 1998

replace rec = AZrec98 if highschoolstate == 3 & cohort == 1998

replace expend = AZexp98 if highschoolstate == 3 & cohort == 1998

*AR|94-14:4

matrix ar94 = ninetyfour * AR'

matrix arrec94 = ninetyfour * ARrec'

matrix arexp94 = ninetyfour * ARexp'


scalar AR94 = ar94[1,1]

scalar ARrec94 = arrec94[1,1]

scalar ARexp94 = arexp94[1,1]


replace exp = AR94 if highschoolstate == 4 & cohort == 1994

replace rec = ARrec94 if highschoolstate == 4 & cohort == 1994

replace expend = ARexp94 if highschoolstate == 4 & cohort == 1994


matrix ar95 = ninetyfive * AR'

matrix arrec95 = ninetyfive * ARrec'

matrix arexp95 = ninetyfive * ARexp'


scalar AR95 = ar95[1,1]

scalar ARrec95 = arrec95[1,1]

scalar ARexp95 = arexp95[1,1]


replace exp = AR95 if highschoolstate == 4 & cohort == 1995

replace rec = ARrec95 if highschoolstate == 4 & cohort == 1995

replace expend = ARexp95 if highschoolstate == 4 & cohort == 1995


matrix ar96 = ninetysix * AR'

matrix arrec96 = ninetysix * ARrec'

matrix arexp96 = ninetysix * ARexp'


scalar AR96 = ar96[1,1]

scalar ARrec96 = arrec96[1,1]

scalar ARexp96 = arexp96[1,1]


replace exp = AR96 if highschoolstate == 4 & cohort == 1996

replace rec = ARrec96 if highschoolstate == 4 & cohort == 1996

replace expend = ARexp96 if highschoolstate == 4 & cohort == 1996


matrix ar97 = ninetyseven * AR'

matrix arrec97 = ninetyseven * ARrec'

matrix arexp97 = ninetyseven * ARexp'


scalar AR97 = ar97[1,1]

scalar ARrec97 = arrec97[1,1]

scalar ARexp97 = arexp97[1,1]


replace exp = AR97 if highschoolstate == 4 & cohort == 1997

replace rec = ARrec97 if highschoolstate == 4 & cohort == 1997

replace expend = ARexp97 if highschoolstate == 4 & cohort == 1997


matrix ar98 = ninetyeight * AR'

matrix arrec98 = ninetyeight * ARrec'

matrix arexp98 = ninetyeight * ARexp'


scalar AR98 = ar98[1,1]

scalar ARrec98 = arrec98[1,1]

scalar ARexp98 = arexp98[1,1]


replace exp = AR98 if highschoolstate == 4 & cohort == 1998

replace rec = ARrec98 if highschoolstate == 4 & cohort == 1998

replace expend = ARexp98 if highschoolstate == 4 & cohort == 1998

*CA|83-16:5

matrix ca94 = ninetyfour * CA'

matrix carec94 = ninetyfour * CArec'

matrix caexp94 = ninetyfour * CAexp'


scalar CA94 = ca94[1,1]

scalar CArec94 = carec94[1,1]

scalar CAexp94 = caexp94[1,1]


replace exp = CA94 if highschoolstate == 5 & cohort == 1994

replace rec = CArec94 if highschoolstate == 5 & cohort == 1994

replace expend = CAexp94 if highschoolstate == 5 & cohort == 1994


matrix ca95 = ninetyfive * CA'

matrix carec95 = ninetyfive * CArec'

matrix caexp95 = ninetyfive * CAexp'


scalar CA95 = ca95[1,1]

scalar CArec95 = carec95[1,1]

scalar CAexp95 = caexp95[1,1]


replace exp = CA95 if highschoolstate == 5 & cohort == 1995

replace rec = CArec95 if highschoolstate == 5 & cohort == 1995

replace expend = CAexp95 if highschoolstate == 5 & cohort == 1995


matrix ca96 = ninetysix * CA'

matrix carec96 = ninetysix * CArec'

matrix caexp96 = ninetysix * CAexp'


scalar CA96 = ca96[1,1]

scalar CArec96 = carec96[1,1]

scalar CAexp96 = caexp96[1,1]


replace exp = CA96 if highschoolstate == 5 & cohort == 1996

replace rec = CArec96 if highschoolstate == 5 & cohort == 1996

replace expend = CAexp96 if highschoolstate == 5 & cohort == 1996


matrix ca97 = ninetyseven * CA'

matrix carec97 = ninetyseven * CArec'

matrix caexp97 = ninetyseven * CAexp'


scalar CA97 = ca97[1,1]

scalar CArec97 = carec97[1,1]

scalar CAexp97 = caexp97[1,1]


replace exp = CA97 if highschoolstate == 5 & cohort == 1997

replace rec = CArec97 if highschoolstate == 5 & cohort == 1997

replace expend = CAexp97 if highschoolstate == 5 & cohort == 1997


matrix ca98 = ninetyeight * CA'

matrix carec98 = ninetyeight * CArec'

matrix caexp98 = ninetyeight * CAexp'


scalar CA98 = ca98[1,1]

scalar CArec98 = carec98[1,1]

scalar CAexp98 = caexp98[1,1]


replace exp = CA98 if highschoolstate == 5 & cohort == 1998

replace rec = CArec98 if highschoolstate == 5 & cohort == 1998

replace expend = CAexp98 if highschoolstate == 5 & cohort == 1998

*CO|01-08:6

matrix co94 = ninetyfour * CO'

matrix corec94 = ninetyfour * COrec'

matrix coexp94 = ninetyfour * COexp'


scalar CO94 = co94[1,1]

scalar COrec94 = corec94[1,1]

scalar COexp94 = coexp94[1,1]


replace exp = CO94 if highschoolstate == 6 & cohort == 1994

replace rec = COrec94 if highschoolstate == 6 & cohort == 1994

replace expend = COexp94 if highschoolstate == 6 & cohort == 1994


matrix co95 = ninetyfive * CO'

matrix corec95 = ninetyfive * COrec'

matrix coexp95 = ninetyfive * COexp'


scalar CO95 = co95[1,1]

scalar COrec95 = corec95[1,1]

scalar COexp95 = coexp95[1,1]


replace exp = CO95 if highschoolstate == 6 & cohort == 1995

replace rec = COrec95 if highschoolstate == 6 & cohort == 1995

replace expend = COexp95 if highschoolstate == 6 & cohort == 1995


matrix co96 = ninetysix * CO'

matrix corec96 = ninetysix * COrec'

matrix coexp96 = ninetysix * COexp'


scalar CO96 = co96[1,1]

scalar COrec96 = corec96[1,1]

scalar COexp96 = coexp96[1,1]


replace exp = CO96 if highschoolstate == 6 & cohort == 1996

replace rec = COrec96 if highschoolstate == 6 & cohort == 1996

replace expend = COexp96 if highschoolstate == 6 & cohort == 1996


matrix co97 = ninetyseven * CO'

matrix corec97 = ninetyseven * COrec'

matrix coexp97 = ninetyseven * COexp'


scalar CO97 = co97[1,1]

scalar COrec97 = corec97[1,1]

scalar COexp97 = coexp97[1,1]


replace exp = CO97 if highschoolstate == 6 & cohort == 1997

replace rec = COrec97 if highschoolstate == 6 & cohort == 1997

replace expend = COexp97 if highschoolstate == 6 & cohort == 1997


matrix co98 = ninetyeight * CO'

matrix corec98 = ninetyeight * COrec'

matrix coexp98 = ninetyeight * COexp'


scalar CO98 = co98[1,1]

scalar COrec98 = corec98[1,1]

scalar COexp98 = coexp98[1,1]


replace exp = CO98 if highschoolstate == 6 & cohort == 1998

replace rec = COrec98 if highschoolstate == 6 & cohort == 1998

replace expend = COexp98 if highschoolstate == 6 & cohort == 1998

*CT| 83-14:7

matrix ct94 = ninetyfour * CT'

matrix ctrec94 = ninetyfour * CTrec'

matrix ctexp94 = ninetyfour * CTexp'


scalar CT94 = ct94[1,1]

scalar CTrec94 = ctrec94[1,1]

scalar CTexp94 = ctexp94[1,1]


replace exp = CT94 if highschoolstate == 7 & cohort == 1994

replace rec = CTrec94 if highschoolstate == 7 & cohort == 1994

replace expend = CTexp94 if highschoolstate == 7 & cohort == 1994


matrix ct95 = ninetyfive * CT'

matrix ctrec95 = ninetyfive * CTrec'

matrix ctexp95 = ninetyfive * CTexp'


scalar CT95 = ct95[1,1]

scalar CTrec95 = ctrec95[1,1]

scalar CTexp95 = ctexp95[1,1]


replace exp = CT95 if highschoolstate == 7 & cohort == 1995

replace rec = CTrec95 if highschoolstate == 7 & cohort == 1995

replace expend = CTexp95 if highschoolstate == 7 & cohort == 1995


matrix ct96 = ninetysix * CT'

matrix ctrec96 = ninetysix * CTrec'

matrix ctexp96 = ninetysix * CTexp'


scalar CT96 = ct96[1,1]

scalar CTrec96 = ctrec96[1,1]

scalar CTexp96 = ctexp96[1,1]


replace exp = CT96 if highschoolstate == 7 & cohort == 1996

replace rec = CTrec96 if highschoolstate == 7 & cohort == 1996

replace expend = CTexp96 if highschoolstate == 7 & cohort == 1996


matrix ct97 = ninetyseven * CT'

matrix ctrec97 = ninetyseven * CTrec'

matrix ctexp97 = ninetyseven * CTexp'


scalar CT97 = ct97[1,1]

scalar CTrec97 = ctrec97[1,1]

scalar CTexp97 = ctexp97[1,1]


replace exp = CT97 if highschoolstate == 7 & cohort == 1997

replace rec = CTrec97 if highschoolstate == 7 & cohort == 1997

replace expend = CTexp97 if highschoolstate == 7 & cohort == 1997


matrix ct98 = ninetyeight * CT'

matrix ctrec98 = ninetyeight * CTrec'

matrix ctexp98 = ninetyeight * CTexp'


scalar CT98 = ct98[1,1]

scalar CTrec98 = ctrec98[1,1]

scalar CTexp98 = ctexp98[1,1]


replace exp = CT98 if highschoolstate == 7 & cohort == 1998

replace rec = CTrec98 if highschoolstate == 7 & cohort == 1998

replace expend = CTexp98 if highschoolstate == 7 & cohort == 1998

*DE|84-16:8

matrix de94 = ninetyfour * DE'

matrix derec94 = ninetyfour * DErec'

matrix deexp94 = ninetyfour * DEexp'


scalar DE94 = de94[1,1]

scalar DErec94 = derec94[1,1]

scalar DEexp94 = deexp94[1,1]


replace exp = DE94 if highschoolstate == 8 & cohort == 1994

replace rec = DErec94 if highschoolstate == 8 & cohort == 1994

replace expend = DEexp94 if highschoolstate == 8 & cohort == 1994


matrix de95 = ninetyfive * DE'

matrix derec95 = ninetyfive * DErec'

matrix deexp95 = ninetyfive * DEexp'


scalar DE95 = de95[1,1]

scalar DErec95 = derec95[1,1]

scalar DEexp95 = deexp95[1,1]


replace exp = DE95 if highschoolstate == 8 & cohort == 1995

replace rec = DErec95 if highschoolstate == 8 & cohort == 1995

replace expend = DEexp95 if highschoolstate == 8 & cohort == 1995


matrix de96 = ninetysix * DE'

matrix derec96 = ninetysix * DErec'

matrix deexp96 = ninetysix * DEexp'


scalar DE96 = de96[1,1]

scalar DErec96 = derec96[1,1]

scalar DEexp96 = deexp96[1,1]


replace exp = DE96 if highschoolstate == 8 & cohort == 1996

replace rec = DErec96 if highschoolstate == 8 & cohort == 1996

replace expend = DEexp96 if highschoolstate == 8 & cohort == 1996


matrix de97 = ninetyseven * DE'

matrix derec97 = ninetyseven * DErec'

matrix deexp97 = ninetyseven * DEexp'


scalar DE97 = de97[1,1]

scalar DErec97 = derec97[1,1]

scalar DEexp97 = deexp97[1,1]


replace exp = DE97 if highschoolstate == 8 & cohort == 1997

replace rec = DErec97 if highschoolstate == 8 & cohort == 1997

replace expend = DEexp97 if highschoolstate == 8 & cohort == 1997


matrix de98 = ninetyeight * DE'

matrix derec98 = ninetyeight * DErec'

matrix deexp98 = ninetyeight * DEexp'


scalar DE98 = de98[1,1]

scalar DErec98 = derec98[1,1]

scalar DEexp98 = deexp98[1,1]


replace exp = DE98 if highschoolstate == 8 & cohort == 1998

replace rec = DErec98 if highschoolstate == 8 & cohort == 1998

replace expend = DEexp98 if highschoolstate == 8 & cohort == 1998

*DC|None:9

*FL|91-14:10

matrix fl94 = ninetyfour * FL'

matrix flrec94 = ninetyfour * FLrec'

matrix flexp94 = ninetyfour * FLexp'


scalar FL94 = fl94[1,1]

scalar FLrec94 = flrec94[1,1]

scalar FLexp94 = flexp94[1,1]


replace exp = FL94 if highschoolstate == 10 & cohort == 1994

replace rec = FLrec94 if highschoolstate == 10 & cohort == 1994

replace expend = FLexp94 if highschoolstate == 10 & cohort == 1994


matrix fl95 = ninetyfive * FL'

matrix flrec95 = ninetyfive * FLrec'

matrix flexp95 = ninetyfive * FLexp'


scalar FL95 = fl95[1,1]

scalar FLrec95 = flrec95[1,1]

scalar FLexp95 = flexp95[1,1]


replace exp = FL95 if highschoolstate == 10 & cohort == 1995

replace rec = FLrec95 if highschoolstate == 10 & cohort == 1995

replace expend = FLexp95 if highschoolstate == 10 & cohort == 1995


matrix fl96 = ninetysix * FL'

matrix flrec96 = ninetysix * FLrec'

matrix flexp96 = ninetysix * FLexp'


scalar FL96 = fl96[1,1]

scalar FLrec96 = flrec96[1,1]

scalar FLexp96 = flexp96[1,1]


replace exp = FL96 if highschoolstate == 10 & cohort == 1996

replace rec = FLrec96 if highschoolstate == 10 & cohort == 1996

replace expend = FLexp96 if highschoolstate == 10 & cohort == 1996


matrix fl97 = ninetyseven * FL'

matrix flrec97 = ninetyseven * FLrec'

matrix flexp97 = ninetyseven * FLexp'


scalar FL97 = fl97[1,1]

scalar FLrec97 = flrec97[1,1]

scalar FLexp97 = flexp97[1,1]


replace exp = FL97 if highschoolstate == 10 & cohort == 1997

replace rec = FLrec97 if highschoolstate == 10 & cohort == 1997

replace expend = FLexp97 if highschoolstate == 10 & cohort == 1997


matrix fl98 = ninetyeight * FL'

matrix flrec98 = ninetyeight * FLrec'

matrix flexp98 = ninetyeight * FLexp'


scalar FL98 = fl98[1,1]

scalar FLrec98 = flrec98[1,1]

scalar FLexp98 = flexp98[1,1]


replace exp = FL98 if highschoolstate == 10 & cohort == 1998

replace rec = FLrec98 if highschoolstate == 10 & cohort == 1998

replace expend = FLexp98 if highschoolstate == 10 & cohort == 1998

*GA|95-11:11

matrix ga94 = ninetyfour * GA'

matrix garec94 = ninetyfour * GArec'

matrix gaexp94 = ninetyfour * GAexp'


scalar GA94 = ga94[1,1]

scalar GArec94 = garec94[1,1]

scalar GAexp94 = gaexp94[1,1]


replace exp = GA94 if highschoolstate == 11 & cohort == 1994

replace rec = GArec94 if highschoolstate == 11 & cohort == 1994

replace expend = GAexp94 if highschoolstate == 11 & cohort == 1994


matrix ga95 = ninetyfive * GA'

matrix garec95 = ninetyfive * GArec'

matrix gaexp95 = ninetyfive * GAexp'


scalar GA95 = ga95[1,1]

scalar GArec95 = garec95[1,1]

scalar GAexp95 = gaexp95[1,1]


replace exp = GA95 if highschoolstate == 11 & cohort == 1995

replace rec = GArec95 if highschoolstate == 11 & cohort == 1995

replace expend = GAexp95 if highschoolstate == 11 & cohort == 1995


matrix ga96 = ninetysix * GA'

matrix garec96 = ninetysix * GArec'

matrix gaexp96 = ninetysix * GAexp'


scalar GA96 = ga96[1,1]

scalar GArec96 = garec96[1,1]

scalar GAexp96 = gaexp96[1,1]


replace exp = GA96 if highschoolstate == 11 & cohort == 1996

replace rec = GArec96 if highschoolstate == 11 & cohort == 1996

replace expend = GAexp96 if highschoolstate == 11 & cohort == 1996


matrix ga97 = ninetyseven * GA'

matrix garec97 = ninetyseven * GArec'

matrix gaexp97 = ninetyseven * GAexp'


scalar GA97 = ga97[1,1]

scalar GArec97 = garec97[1,1]

scalar GAexp97 = gaexp97[1,1]


replace exp = GA97 if highschoolstate == 11 & cohort == 1997

replace rec = GArec97 if highschoolstate == 11 & cohort == 1997

replace expend = GAexp97 if highschoolstate == 11 & cohort == 1997


matrix ga98 = ninetyeight * GA'

matrix garec98 = ninetyeight * GArec'

matrix gaexp98 = ninetyeight * GAexp'


scalar GA98 = ga98[1,1]

scalar GArec98 = garec98[1,1]

scalar GAexp98 = gaexp98[1,1]


replace exp = GA98 if highschoolstate == 11 & cohort == 1998

replace rec = GArec98 if highschoolstate == 11 & cohort == 1998

replace expend = GAexp98 if highschoolstate == 11 & cohort == 1998

*HI|02-04:12

matrix hi94 = ninetyfour * HI'

matrix hirec94 = ninetyfour * HIrec'

matrix hiexp94 = ninetyfour * HIexp'


scalar HI94 = hi94[1,1]

scalar HIrec94 = hirec94[1,1]

scalar HIexp94 = hiexp94[1,1]


replace exp = HI94 if highschoolstate == 12 & cohort == 1994

replace rec = HIrec94 if highschoolstate == 12 & cohort == 1994

replace expend = HIexp94 if highschoolstate == 12 & cohort == 1994


matrix hi95 = ninetyfive * HI'

matrix hirec95 = ninetyfive * HIrec'

matrix hiexp95 = ninetyfive * HIexp'


scalar HI95 = hi95[1,1]

scalar HIrec95 = hirec95[1,1]

scalar HIexp95 = hiexp95[1,1]


replace exp = HI95 if highschoolstate == 12 & cohort == 1995

replace rec = HIrec95 if highschoolstate == 12 & cohort == 1995

replace expend = HIexp95 if highschoolstate == 12 & cohort == 1995


matrix hi96 = ninetysix * HI'

matrix hirec96 = ninetysix * HIrec'

matrix hiexp96 = ninetysix * HIexp'


scalar HI96 = hi96[1,1]

scalar HIrec96 = hirec96[1,1]

scalar HIexp96 = hiexp96[1,1]


replace exp = HI96 if highschoolstate == 12 & cohort == 1996

replace rec = HIrec96 if highschoolstate == 12 & cohort == 1996

replace expend = HIexp96 if highschoolstate == 12 & cohort == 1996


matrix hi97 = ninetyseven * HI'

matrix hirec97 = ninetyseven * HIrec'

matrix hiexp97 = ninetyseven * HIexp'


scalar HI97 = hi97[1,1]

scalar HIrec97 = hirec97[1,1]

scalar HIexp97 = hiexp97[1,1]


replace exp = HI97 if highschoolstate == 12 & cohort == 1997

replace rec = HIrec97 if highschoolstate == 12 & cohort == 1997

replace expend = HIexp97 if highschoolstate == 12 & cohort == 1997


matrix hi98 = ninetyeight * HI'

matrix hirec98 = ninetyeight * HIrec'

matrix hiexp98 = ninetyeight * HIexp'


scalar HI98 = hi98[1,1]

scalar HIrec98 = hirec98[1,1]

scalar HIexp98 = hiexp98[1,1]


replace exp = HI98 if highschoolstate == 12 & cohort == 1998

replace rec = HIrec98 if highschoolstate == 12 & cohort == 1998

replace expend = HIexp98 if highschoolstate == 12 & cohort == 1998

*ID|92-93:13

matrix id94 = ninetyfour * ID'

matrix idrec94 = ninetyfour * IDrec'

matrix idexp94 = ninetyfour * IDexp'


scalar ID94 = id94[1,1]

scalar IDrec94 = idrec94[1,1]

scalar IDexp94 = idexp94[1,1]


replace exp = ID94 if highschoolstate == 13 & cohort == 1994

replace rec = IDrec94 if highschoolstate == 13 & cohort == 1994

replace expend = IDexp94 if highschoolstate == 13 & cohort == 1994


matrix id95 = ninetyfive * ID'

matrix idrec95 = ninetyfive * IDrec'

matrix idexp95 = ninetyfive * IDexp'


scalar ID95 = id95[1,1]

scalar IDrec95 = idrec95[1,1]

scalar IDexp95 = idexp95[1,1]


replace exp = ID95 if highschoolstate == 13 & cohort == 1995

replace rec = IDrec95 if highschoolstate == 13 & cohort == 1995

replace expend = IDexp95 if highschoolstate == 13 & cohort == 1995


matrix id96 = ninetysix * ID'

matrix idrec96 = ninetysix * IDrec'

matrix idexp96 = ninetysix * IDexp'


scalar ID96 = id96[1,1]

scalar IDrec96 = idrec96[1,1]

scalar IDexp96 = idexp96[1,1]


replace exp = ID96 if highschoolstate == 13 & cohort == 1996

replace rec = IDrec96 if highschoolstate == 13 & cohort == 1996

replace expend = IDexp96 if highschoolstate == 13 & cohort == 1996


matrix id97 = ninetyseven * ID'

matrix idrec97 = ninetyseven * IDrec'

matrix idexp97 = ninetyseven * IDexp'


scalar ID97 = id97[1,1]

scalar IDrec97 = idrec97[1,1]

scalar IDexp97 = idexp97[1,1]


replace exp = ID97 if highschoolstate == 13 & cohort == 1997

replace rec = IDrec97 if highschoolstate == 13 & cohort == 1997

replace expend = IDexp97 if highschoolstate == 13 & cohort == 1997


matrix id98 = ninetyeight * ID'

matrix idrec98 = ninetyeight * IDrec'

matrix idexp98 = ninetyeight * IDexp'


scalar ID98 = id98[1,1]

scalar IDrec98 = idrec98[1,1]

scalar IDexp98 = idexp98[1,1]


replace exp = ID98 if highschoolstate == 13 & cohort == 1998

replace rec = IDrec98 if highschoolstate == 13 & cohort == 1998

replace expend = IDexp98 if highschoolstate == 13 & cohort == 1998

*IL|86-16:14

matrix il94 = ninetyfour * IL'

matrix ilrec94 = ninetyfour * ILrec'

matrix ilexp94 = ninetyfour * ILexp'


scalar IL94 = il94[1,1]

scalar ILrec94 = ilrec94[1,1]

scalar ILexp94 = ilexp94[1,1]


replace exp = IL94 if highschoolstate == 14 & cohort == 1994

replace rec = ILrec94 if highschoolstate == 14 & cohort == 1994

replace expend = ILexp94 if highschoolstate == 14 & cohort == 1994


matrix il95 = ninetyfive * IL'

matrix ilrec95 = ninetyfive * ILrec'

matrix ilexp95 = ninetyfive * ILexp'


scalar IL95 = il95[1,1]

scalar ILrec95 = ilrec95[1,1]

scalar ILexp95 = ilexp95[1,1]


replace exp = IL95 if highschoolstate == 14 & cohort == 1995

replace rec = ILrec95 if highschoolstate == 14 & cohort == 1995

replace expend = ILexp95 if highschoolstate == 14 & cohort == 1995


matrix il96 = ninetysix * IL'

matrix ilrec96 = ninetysix * ILrec'

matrix ilexp96 = ninetysix * ILexp'


scalar IL96 = il96[1,1]

scalar ILrec96 = ilrec96[1,1]

scalar ILexp96 = ilexp96[1,1]


replace exp = IL96 if highschoolstate == 14 & cohort == 1996

replace rec = ILrec96 if highschoolstate == 14 & cohort == 1996

replace expend = ILexp96 if highschoolstate == 14 & cohort == 1996


matrix il97 = ninetyseven * IL'

matrix ilrec97 = ninetyseven * ILrec'

matrix ilexp97 = ninetyseven * ILexp'


scalar IL97 = il97[1,1]

scalar ILrec97 = ilrec97[1,1]

scalar ILexp97 = ilexp97[1,1]


replace exp = IL97 if highschoolstate == 14 & cohort == 1997

replace rec = ILrec97 if highschoolstate == 14 & cohort == 1997

replace expend = ILexp97 if highschoolstate == 14 & cohort == 1997


matrix il98 = ninetyeight * IL'

matrix ilrec98 = ninetyeight * ILrec'

matrix ilexp98 = ninetyeight * ILexp'


scalar IL98 = il98[1,1]

scalar ILrec98 = ilrec98[1,1]

scalar ILexp98 = ilexp98[1,1]


replace exp = IL98 if highschoolstate == 14 & cohort == 1998

replace rec = ILrec98 if highschoolstate == 14 & cohort == 1998

replace expend = ILexp98 if highschoolstate == 14 & cohort == 1998

*IN|91-14:15

matrix in94 = ninetyfour * IN'

matrix inrec94 = ninetyfour * INrec'

matrix inexp94 = ninetyfour * INexp'


scalar IN94 = in94[1,1]

scalar INrec94 = inrec94[1,1]

scalar INexp94 = inexp94[1,1]


replace exp = IN94 if highschoolstate == 15 & cohort == 1994

replace rec = INrec94 if highschoolstate == 15 & cohort == 1994

replace expend = INexp94 if highschoolstate == 15 & cohort == 1994


matrix in95 = ninetyfive * IN'

matrix inrec95 = ninetyfive * INrec'

matrix inexp95 = ninetyfive * INexp'


scalar IN95 = in95[1,1]

scalar INrec95 = inrec95[1,1]

scalar INexp95 = inexp95[1,1]


replace exp = IN95 if highschoolstate == 15 & cohort == 1995

replace rec = INrec95 if highschoolstate == 15 & cohort == 1995

replace expend = INexp95 if highschoolstate == 15 & cohort == 1995


matrix in96 = ninetysix * IN'

matrix inrec96 = ninetysix * INrec'

matrix inexp96 = ninetysix * INexp'


scalar IN96 = in96[1,1]

scalar INrec96 = inrec96[1,1]

scalar INexp96 = inexp96[1,1]


replace exp = IN96 if highschoolstate == 15 & cohort == 1996

replace rec = INrec96 if highschoolstate == 15 & cohort == 1996

replace expend = INexp96 if highschoolstate == 15 & cohort == 1996


matrix in97 = ninetyseven * IN'

matrix inrec97 = ninetyseven * INrec'

matrix inexp97 = ninetyseven * INexp'


scalar IN97 = in97[1,1]

scalar INrec97 = inrec97[1,1]

scalar INexp97 = inexp97[1,1]


replace exp = IN97 if highschoolstate == 15 & cohort == 1997

replace rec =INrec97 if highschoolstate == 15 & cohort == 1997

replace expend = INexp97 if highschoolstate == 15 & cohort == 1997


matrix in98 = ninetyeight * IN'

matrix inrec98 = ninetyeight * INrec'

matrix inexp98 = ninetyeight * INexp'


scalar IN98 = in98[1,1]

scalar INrec98 = inrec98[1,1]

scalar INexp98 = inexp98[1,1]


replace exp = IN98 if highschoolstate == 15 & cohort == 1998

replace rec = INrec98 if highschoolstate == 15 & cohort == 1998

replace expend = INexp98 if highschoolstate == 15 & cohort == 1998

*IA|01-16:16

matrix ia94 = ninetyfour * IA'

matrix iarec94 = ninetyfour * IArec'

matrix iaexp94 = ninetyfour * IAexp'


scalar IA94 = ia94[1,1]

scalar IArec94 = iarec94[1,1]

scalar IAexp94 = iaexp94[1,1]


replace exp = IA94 if highschoolstate == 16 & cohort == 1994

replace rec = IArec94 if highschoolstate == 16 & cohort == 1994

replace expend = IAexp94 if highschoolstate == 16 & cohort == 1994


matrix ia95 = ninetyfive * IA'

matrix iarec95 = ninetyfive * IArec'

matrix iaexp95 = ninetyfive * IAexp'


scalar IA95 = ia95[1,1]

scalar IArec95 = iarec95[1,1]

scalar IAexp95 = iaexp95[1,1]


replace exp = IA95 if highschoolstate == 16 & cohort == 1995

replace rec = IArec95 if highschoolstate == 16 & cohort == 1995

replace expend = IAexp95 if highschoolstate == 16 & cohort == 1995


matrix ia96 = ninetysix * IA'

matrix iarec96 = ninetysix * IArec'

matrix iaexp96 = ninetysix * IAexp'


scalar IA96 = ia96[1,1]

scalar IArec96 = iarec96[1,1]

scalar IAexp96 = iaexp96[1,1]


replace exp = IA96 if highschoolstate == 16 & cohort == 1996

replace rec = IArec96 if highschoolstate == 16 & cohort == 1996

replace expend = IAexp96 if highschoolstate == 16 & cohort == 1996


matrix ia97 = ninetyseven * IA'

matrix iarec97 = ninetyseven * IArec'

matrix iaexp97 = ninetyseven * IAexp'


scalar IA97 = ia97[1,1]

scalar IArec97 = iarec97[1,1]

scalar IAexp97 = iaexp97[1,1]


replace exp = IA97 if highschoolstate == 16 & cohort == 1997

replace rec = IArec97 if highschoolstate == 16 & cohort == 1997

replace expend = IAexp97 if highschoolstate == 16 & cohort == 1997


matrix ia98 = ninetyeight * IA'

matrix iarec98 = ninetyeight * IArec'

matrix iaexp98 = ninetyeight * IAexp'


scalar IA98 = ia98[1,1]

scalar IArec98 = iarec98[1,1]

scalar IAexp98 = iaexp98[1,1]


replace exp = IA98 if highschoolstate == 16 & cohort == 1998

replace rec = IArec98 if highschoolstate == 16 & cohort == 1998

replace expend = IAexp98 if highschoolstate == 16 & cohort == 1998

*KS|05-07:17

matrix ks94 = ninetyfour * KS'

matrix ksrec94 = ninetyfour * KSrec'

matrix ksexp94 = ninetyfour * KSexp'


scalar KS94 = ks94[1,1]

scalar KSrec94 = ksrec94[1,1]

scalar KSexp94 = ksexp94[1,1]


replace exp = KS94 if highschoolstate == 17 & cohort == 1994

replace rec = KSrec94 if highschoolstate == 17 & cohort == 1994

replace expend = KSexp94 if highschoolstate == 17 & cohort == 1994


matrix ks95 = ninetyfive * KS'

matrix ksrec95 = ninetyfive * KSrec'

matrix ksexp95 = ninetyfive * KSexp'


scalar KS95 = ks95[1,1]

scalar KSrec95 = ksrec95[1,1]

scalar KSexp95 = ksexp95[1,1]


replace exp = KS95 if highschoolstate == 17 & cohort == 1995

replace rec = KSrec95 if highschoolstate == 17 & cohort == 1995

replace expend = KSexp95 if highschoolstate == 17 & cohort == 1995


matrix ks96 = ninetysix * KS'

matrix ksrec96 = ninetysix * KSrec'

matrix ksexp96 = ninetysix * KSexp'


scalar KS96 = ks96[1,1]

scalar KSrec96 = ksrec96[1,1]

scalar KSexp96 = ksexp96[1,1]


replace exp = KS96 if highschoolstate == 17 & cohort == 1996

replace rec = KSrec96 if highschoolstate == 17 & cohort == 1996

replace expend = KSexp96 if highschoolstate == 17 & cohort == 1996


matrix ks97 = ninetyseven * KS'

matrix ksrec97 = ninetyseven * KSrec'

matrix ksexp97 = ninetyseven * KSexp'


scalar KS97 = ks97[1,1]

scalar KSrec97 = ksrec97[1,1]

scalar KSexp97 = ksexp97[1,1]


replace exp = KS97 if highschoolstate == 17 & cohort == 1997

replace rec = KSrec97 if highschoolstate == 17 & cohort == 1997

replace expend = KSexp97 if highschoolstate == 17 & cohort == 1997


matrix ks98 = ninetyeight * KS'

matrix ksrec98 = ninetyeight * KSrec'

matrix ksexp98 = ninetyeight * KSexp'


scalar KS98 = ks98[1,1]

scalar KSrec98 = ksrec98[1,1]

scalar KSexp98 = ksexp98[1,1]


replace exp = KS98 if highschoolstate == 17 & cohort == 1998

replace rec = KSrec98 if highschoolstate == 17 & cohort == 1998

replace expend = KSexp98 if highschoolstate == 17 & cohort == 1998

*KY|91-14:18

matrix ky94 = ninetyfour * KY'

matrix kyrec94 = ninetyfour * KYrec'

matrix kyexp94 = ninetyfour * KYexp'


scalar KY94 = ky94[1,1]

scalar KYrec94 = kyrec94[1,1]

scalar KYexp94 = kyexp94[1,1]


replace exp = KY94 if highschoolstate == 18 & cohort == 1994

replace rec = KYrec94 if highschoolstate == 18 & cohort == 1994

replace expend = KYexp94 if highschoolstate == 18 & cohort == 1994


matrix ky95 = ninetyfive * KY'

matrix kyrec95 = ninetyfive * KYrec'

matrix kyexp95 = ninetyfive * KYexp'


scalar KY95 = ky95[1,1]

scalar KYrec95 = kyrec95[1,1]

scalar KYexp95 = kyexp95[1,1]


replace exp = KY95 if highschoolstate == 18 & cohort == 1995

replace rec = KYrec95 if highschoolstate == 18 & cohort == 1995

replace expend = KYexp95 if highschoolstate == 18 & cohort == 1995


matrix ky96 = ninetysix * KY'

matrix kyrec96 = ninetysix * KYrec'

matrix kyexp96 = ninetysix * KYexp'


scalar KY96 = ky96[1,1]

scalar KYrec96 = kyrec96[1,1]

scalar KYexp96 = kyexp96[1,1]


replace exp = KY96 if highschoolstate == 18 & cohort == 1996

replace rec = KYrec96 if highschoolstate == 18 & cohort == 1996

replace expend = KYexp96 if highschoolstate == 18 & cohort == 1996


matrix ky97 = ninetyseven * KY'

matrix kyrec97 = ninetyseven * KYrec'

matrix kyexp97 = ninetyseven * KYexp'


scalar KY97 = ky97[1,1]

scalar KYrec97 = kyrec97[1,1]

scalar KYexp97 = kyexp97[1,1]


replace exp = KY97 if highschoolstate == 18 & cohort == 1997

replace rec = KYrec97 if highschoolstate == 18 & cohort == 1997

replace expend = KYexp97 if highschoolstate == 18 & cohort == 1997


matrix ky98 = ninetyeight * KY'

matrix kyrec98 = ninetyeight * KYrec'

matrix kyexp98 = ninetyeight * KYexp'


scalar KY98 = ky98[1,1]

scalar KYrec98 = kyrec98[1,1]

scalar KYexp98 = kyexp98[1,1]


replace exp = KY98 if highschoolstate == 18 & cohort == 1998

replace rec = KYrec98 if highschoolstate == 18 & cohort == 1998

replace expend = KYexp98 if highschoolstate == 18 & cohort == 1998

*LA|03-05:19

matrix la94 = ninetyfour * LA'

matrix larec94 = ninetyfour * LArec'

matrix laexp94 = ninetyfour * LAexp'


scalar LA94 = la94[1,1]

scalar LArec94 = larec94[1,1]

scalar LAexp94 = laexp94[1,1]


replace exp = LA94 if highschoolstate == 19 & cohort == 1994

replace rec = LArec94 if highschoolstate == 19 & cohort == 1994

replace expend = LAexp94 if highschoolstate == 19 & cohort == 1994


matrix la95 = ninetyfive * LA'

matrix larec95 = ninetyfive * LArec'

matrix laexp95 = ninetyfive * LAexp'


scalar LA95 = la95[1,1]

scalar LArec95 = larec95[1,1]

scalar LAexp95 = laexp95[1,1]


replace exp = LA95 if highschoolstate == 19 & cohort == 1995

replace rec = LArec95 if highschoolstate == 19 & cohort == 1995

replace expend = LAexp95 if highschoolstate == 19 & cohort == 1995


matrix la96 = ninetysix * LA'

matrix larec96 = ninetysix * LArec'

matrix laexp96 = ninetysix * LAexp'


scalar LA96 = la96[1,1]

scalar LArec96 = larec96[1,1]

scalar LAexp96 = laexp96[1,1]


replace exp = LA96 if highschoolstate == 19 & cohort == 1996

replace rec = LArec96 if highschoolstate == 19 & cohort == 1996

replace expend = LAexp96 if highschoolstate == 19 & cohort == 1996


matrix la97 = ninetyseven * LA'

matrix larec97 = ninetyseven * LArec'

matrix laexp97 = ninetyseven * LAexp'


scalar LA97 = la97[1,1]

scalar LArec97 = larec97[1,1]

scalar LAexp97 = laexp97[1,1]


replace exp = LA97 if highschoolstate == 19 & cohort == 1997

replace rec = LArec97 if highschoolstate == 19 & cohort == 1997

replace expend = LAexp97 if highschoolstate == 19 & cohort == 1997


matrix la98 = ninetyeight * LA'

matrix larec98 = ninetyeight * LArec'

matrix laexp98 = ninetyeight * LAexp'


scalar LA98 = la98[1,1]

scalar LArec98 = larec98[1,1]

scalar LAexp98 = laexp98[1,1]


replace exp = LA98 if highschoolstate == 19 & cohort == 1998

replace rec = LArec98 if highschoolstate == 19 & cohort == 1998

replace expend = LAexp98 if highschoolstate == 19 & cohort == 1998

*ME|98-14:20

matrix me94 = ninetyfour * ME'

matrix merec94 = ninetyfour * MErec'

matrix meexp94 = ninetyfour * MEexp'


scalar ME94 = me94[1,1]

scalar MErec94 = merec94[1,1]

scalar MEexp94 = meexp94[1,1]


replace exp = ME94 if highschoolstate == 20 & cohort == 1994

replace rec = MErec94 if highschoolstate == 20 & cohort == 1994

replace expend = MEexp94 if highschoolstate == 20 & cohort == 1994


matrix me95 = ninetyfive * ME'

matrix merec95 = ninetyfive * MErec'

matrix meexp95 = ninetyfive * MEexp'


scalar ME95 = me95[1,1]

scalar MErec95 = merec95[1,1]

scalar MEexp95 = meexp95[1,1]


replace exp = ME95 if highschoolstate == 20 & cohort == 1995

replace rec = MErec95 if highschoolstate == 20 & cohort == 1995

replace expend = MEexp95 if highschoolstate == 20 & cohort == 1995


matrix me96 = ninetysix * ME'

matrix merec96 = ninetysix * MErec'

matrix meexp96 = ninetysix * MEexp'


scalar ME96 = me96[1,1]

scalar MErec96 = merec96[1,1]

scalar MEexp96 = meexp96[1,1]


replace exp = ME96 if highschoolstate == 20 & cohort == 1996

replace rec = MErec96 if highschoolstate == 20 & cohort == 1996

replace expend = MEexp96 if highschoolstate == 20 & cohort == 1996


matrix me97 = ninetyseven * ME'

matrix merec97 = ninetyseven * MErec'

matrix meexp97 = ninetyseven * MEexp'


scalar ME97 = me97[1,1]

scalar MErec97 = merec97[1,1]

scalar MEexp97 = meexp97[1,1]


replace exp = ME97 if highschoolstate == 20 & cohort == 1997

replace rec = MErec97 if highschoolstate == 20 & cohort == 1997

replace expend = MEexp97 if highschoolstate == 20 & cohort == 1997


matrix me98 = ninetyeight * ME'

matrix merec98 = ninetyeight * MErec'

matrix meexp98 = ninetyeight * MEexp'


scalar ME98 = me98[1,1]

scalar MErec98 = merec98[1,1]

scalar MEexp98 = meexp98[1,1]


replace exp = ME98 if highschoolstate == 20 & cohort == 1998

replace rec = MErec98 if highschoolstate == 20 & cohort == 1998

replace expend = MEexp98 if highschoolstate == 20 & cohort == 1998

*MD|91-14:21

matrix md94 = ninetyfour * MD'

matrix mdrec94 = ninetyfour * MDrec'

matrix mdexp94 = ninetyfour * MDexp'


scalar MD94 = md94[1,1]

scalar MDrec94 = mdrec94[1,1]

scalar MDexp94 = mdexp94[1,1]


replace exp = MD94 if highschoolstate == 21 & cohort == 1994

replace rec = MDrec94 if highschoolstate == 21 & cohort == 1994

replace expend = MDexp94 if highschoolstate == 21 & cohort == 1994


matrix md95 = ninetyfive * MD'

matrix mdrec95 = ninetyfive * MDrec'

matrix mdexp95 = ninetyfive * MDexp'


scalar MD95 = md95[1,1]

scalar MDrec95 = mdrec95[1,1]

scalar MDexp95 = mdexp95[1,1]


replace exp = MD95 if highschoolstate == 21 & cohort == 1995

replace rec = MDrec95 if highschoolstate == 21 & cohort == 1995

replace expend = MDexp95 if highschoolstate == 21 & cohort == 1995


matrix md96 = ninetysix * MD'

matrix mdrec96 = ninetysix * MDrec'

matrix mdexp96 = ninetysix * MDexp'


scalar MD96 = md96[1,1]

scalar MDrec96 = mdrec96[1,1]

scalar MDexp96 = mdexp96[1,1]


replace exp = MD96 if highschoolstate == 21 & cohort == 1996

replace rec = MDrec96 if highschoolstate == 21 & cohort == 1996

replace expend = MDexp96 if highschoolstate == 21 & cohort == 1996


matrix md97 = ninetyseven * MD'

matrix mdrec97 = ninetyseven * MDrec'

matrix mdexp97 = ninetyseven * MDexp'


scalar MD97 = md97[1,1]

scalar MDrec97 = mdrec97[1,1]

scalar MDexp97 = mdexp97[1,1]


replace exp = MD97 if highschoolstate == 21 & cohort == 1997

replace rec = MDrec97 if highschoolstate == 21 & cohort == 1997

replace expend = MDexp97 if highschoolstate == 21 & cohort == 1997


matrix md98 = ninetyeight * MD'

matrix mdrec98 = ninetyeight * MDrec'

matrix mdexp98 = ninetyeight * MDexp'


scalar MD98 = md98[1,1]

scalar MDrec98 = mdrec98[1,1]

scalar MDexp98 = mdexp98[1,1]


replace exp = MD98 if highschoolstate == 21 & cohort == 1998

replace rec = MDrec98 if highschoolstate == 21 & cohort == 1998

replace expend = MDexp98 if highschoolstate == 21 & cohort == 1998

*MA|99-16:22

matrix ma94 = ninetyfour * MA'

matrix marec94 = ninetyfour * MArec'

matrix maexp94 = ninetyfour * MAexp'


scalar MA94 = ma94[1,1]

scalar MArec94 = marec94[1,1]

scalar MAexp94 = maexp94[1,1]


replace exp = MA94 if highschoolstate == 22 & cohort == 1994

replace rec = MArec94 if highschoolstate == 22 & cohort == 1994

replace expend = MAexp94 if highschoolstate == 22 & cohort == 1994


matrix ma95 = ninetyfive * MA'

matrix marec95 = ninetyfive * MArec'

matrix maexp95 = ninetyfive * MAexp'


scalar MA95 = ma95[1,1]

scalar MArec95 = marec95[1,1]

scalar MAexp95 = maexp95[1,1]


replace exp = MA95 if highschoolstate == 22 & cohort == 1995

replace rec = MArec95 if highschoolstate == 22 & cohort == 1995

replace expend = MAexp95 if highschoolstate == 22 & cohort == 1995


matrix ma96 = ninetysix * MA'

matrix marec96 = ninetysix * MArec'

matrix maexp96 = ninetysix * MAexp'


scalar MA96 = ma96[1,1]

scalar MArec96 = marec96[1,1]

scalar MAexp96 = maexp96[1,1]


replace exp = MA96 if highschoolstate == 22 & cohort == 1996

replace rec = MArec96 if highschoolstate == 22 & cohort == 1996

replace expend = MAexp96 if highschoolstate == 22 & cohort == 1996


matrix ma97 = ninetyseven * MA'

matrix marec97 = ninetyseven * MArec'

matrix maexp97 = ninetyseven * MAexp'


scalar MA97 = ma97[1,1]

scalar MArec97 = marec97[1,1]

scalar MAexp97 = maexp97[1,1]


replace exp = MA97 if highschoolstate == 22 & cohort == 1997

replace rec = MArec97 if highschoolstate == 22 & cohort == 1997

replace expend = MAexp97 if highschoolstate == 22 & cohort == 1997


matrix ma98 = ninetyeight * MA'

matrix marec98 = ninetyeight * MArec'

matrix maexp98 = ninetyeight * MAexp'


scalar MA98 = ma98[1,1]

scalar MArec98 = marec98[1,1]

scalar MAexp98 = maexp98[1,1]


replace exp = MA98 if highschoolstate == 22 & cohort == 1998

replace rec = MArec98 if highschoolstate == 22 & cohort == 1998

replace expend = MAexp98 if highschoolstate == 22 & cohort == 1998

*MI|None:23

*MN|None:24

*MS|91-16:25

matrix ms94 = ninetyfour * MS'

matrix msrec94 = ninetyfour * MSrec'

matrix msexp94 = ninetyfour * MSexp'


scalar MS94 = ms94[1,1]

scalar MSrec94 = msrec94[1,1]

scalar MSexp94 = msexp94[1,1]


replace exp = MS94 if highschoolstate == 25 & cohort == 1994

replace rec = MSrec94 if highschoolstate == 25 & cohort == 1994

replace expend = MSexp94 if highschoolstate == 25 & cohort == 1994


matrix ms95 = ninetyfive * MS'

matrix msrec95 = ninetyfive * MSrec'

matrix msexp95 = ninetyfive * MSexp'


scalar MS95 = ms95[1,1]

scalar MSrec95 = msrec95[1,1]

scalar MSexp95 = msexp95[1,1]


replace exp = MS95 if highschoolstate == 25 & cohort == 1995

replace rec = MSrec95 if highschoolstate == 25 & cohort == 1995

replace expend = MSexp95 if highschoolstate == 25 & cohort == 1995


matrix ms96 = ninetysix * MS'

matrix msrec96 = ninetysix * MSrec'

matrix msexp96 = ninetysix * MSexp'


scalar MS96 = ms96[1,1]

scalar MSrec96 = msrec96[1,1]

scalar MSexp96 = msexp96[1,1]


replace exp = MS96 if highschoolstate == 25 & cohort == 1996

replace rec = MSrec96 if highschoolstate == 25 & cohort == 1996

replace expend = MSexp96 if highschoolstate == 25 & cohort == 1996


matrix ms97 = ninetyseven * MS'

matrix msrec97 = ninetyseven * MSrec'

matrix msexp97 = ninetyseven * MSexp'


scalar MS97 = ms97[1,1]

scalar MSrec97 = msrec97[1,1]

scalar MSexp97 = msexp97[1,1]


replace exp = MS97 if highschoolstate == 25 & cohort == 1997

replace rec = MSrec97 if highschoolstate == 25 & cohort == 1997

replace expend = MSexp97 if highschoolstate == 25 & cohort == 1997


matrix ms98 = ninetyeight * MS'

matrix msrec98 = ninetyeight * MSrec'

matrix msexp98 = ninetyeight * MSexp'


scalar MS98 = ms98[1,1]

scalar MSrec98 = msrec98[1,1]

scalar MSexp98 = msexp98[1,1]


replace exp = MS98 if highschoolstate == 25 & cohort == 1998

replace rec = MSrec98 if highschoolstate == 25 & cohort == 1998

replace expend = MSexp98 if highschoolstate == 25 & cohort == 1998

*MO|03-15:26

matrix mo94 = ninetyfour * MO'

matrix morec94 = ninetyfour * MOrec'

matrix moexp94 = ninetyfour * MOexp'


scalar MO94 = mo94[1,1]

scalar MOrec94 = morec94[1,1]

scalar MOexp94 = moexp94[1,1]


replace exp = MO94 if highschoolstate == 26 & cohort == 1994

replace rec = MOrec94 if highschoolstate == 26 & cohort == 1994

replace expend = MOexp94 if highschoolstate == 26 & cohort == 1994


matrix mo95 = ninetyfive * MO'

matrix morec95 = ninetyfive * MOrec'

matrix moexp95 = ninetyfive * MOexp'


scalar MO95 = mo95[1,1]

scalar MOrec95 = morec95[1,1]

scalar MOexp95 = moexp95[1,1]


replace exp = MO95 if highschoolstate == 26 & cohort == 1995

replace rec = MOrec95 if highschoolstate == 26 & cohort == 1995

replace expend = MOexp95 if highschoolstate == 26 & cohort == 1995


matrix mo96 = ninetysix * MO'

matrix morec96 = ninetysix * MOrec'

matrix moexp96 = ninetysix * MOexp'


scalar MO96 = mo96[1,1]

scalar MOrec96 = morec96[1,1]

scalar MOexp96 = moexp96[1,1]


replace exp = MO96 if highschoolstate == 26 & cohort == 1996

replace rec = MOrec96 if highschoolstate == 26 & cohort == 1996

replace expend = MOexp96 if highschoolstate == 26 & cohort == 1996


matrix mo97 = ninetyseven * MO'

matrix morec97 = ninetyseven * MOrec'

matrix moexp97 = ninetyseven * MOexp'


scalar MO97 = mo97[1,1]

scalar MOrec97 = morec97[1,1]

scalar MOexp97 = moexp97[1,1]


replace exp = MO97 if highschoolstate == 26 & cohort == 1997

replace rec = MOrec97 if highschoolstate == 26 & cohort == 1997

replace expend = MOexp97 if highschoolstate == 26 & cohort == 1997


matrix mo98 = ninetyeight * MO'

matrix morec98 = ninetyeight * MOrec'

matrix moexp98 = ninetyeight * MOexp'


scalar MO98 = mo98[1,1]

scalar MOrec98 = morec98[1,1]

scalar MOexp98 = moexp98[1,1]


replace exp = MO98 if highschoolstate == 26 & cohort == 1998

replace rec = MOrec98 if highschoolstate == 26 & cohort == 1998

replace expend = MOexp98 if highschoolstate == 26 & cohort == 1998

*MT|07-16:27

matrix mt94 = ninetyfour * MT'

matrix mtrec94 = ninetyfour * MTrec'

matrix mtexp94 = ninetyfour * MTexp'


scalar MT94 = mt94[1,1]

scalar MTrec94 = mtrec94[1,1]

scalar MTexp94 = mtexp94[1,1]


replace exp = MT94 if highschoolstate == 27 & cohort == 1994

replace rec = MTrec94 if highschoolstate == 27 & cohort == 1994

replace expend = MTexp94 if highschoolstate == 27 & cohort == 1994


matrix mt95 = ninetyfive * MT'

matrix mtrec95 = ninetyfive * MTrec'

matrix mtexp95 = ninetyfive * MTexp'


scalar MT95 = mt95[1,1]

scalar MTrec95 = mtrec95[1,1]

scalar MTexp95 = mtexp95[1,1]


replace exp = MT95 if highschoolstate == 27 & cohort == 1995

replace rec = MTrec95 if highschoolstate == 27 & cohort == 1995

replace expend = MTexp95 if highschoolstate == 27 & cohort == 1995


matrix mt96 = ninetysix * MT'

matrix mtrec96 = ninetysix * MTrec'

matrix mtexp96 = ninetysix * MTexp'


scalar MT96 = mt96[1,1]

scalar MTrec96 = mtrec96[1,1]

scalar MTexp96 = mtexp96[1,1]


replace exp = MT96 if highschoolstate == 27 & cohort == 1996

replace rec = MTrec96 if highschoolstate == 27 & cohort == 1996

replace expend = MTexp96 if highschoolstate == 27 & cohort == 1996


matrix mt97 = ninetyseven * MT'

matrix mtrec97 = ninetyseven * MTrec'

matrix mtexp97 = ninetyseven * MTexp'


scalar MT97 = mt97[1,1]

scalar MTrec97 = mtrec97[1,1]

scalar MTexp97 = mtexp97[1,1]


replace exp = MT97 if highschoolstate == 27 & cohort == 1997

replace rec = MTrec97 if highschoolstate == 27 & cohort == 1997

replace expend = MTexp97 if highschoolstate == 27 & cohort == 1997


matrix mt98 = ninetyeight * MT'

matrix mtrec98 = ninetyeight * MTrec'

matrix mtexp98 = ninetyeight * MTexp'


scalar MT98 = mt98[1,1]

scalar MTrec98 = mtrec98[1,1]

scalar MTexp98 = mtexp98[1,1]


replace exp = MT98 if highschoolstate == 27 & cohort == 1998

replace rec = MTrec98 if highschoolstate == 27 & cohort == 1998

replace expend = MTexp98 if highschoolstate == 27 & cohort == 1998

*NE|00-12:28

matrix ne94 = ninetyfour * NE'

matrix nerec94 = ninetyfour * NErec'

matrix neexp94 = ninetyfour * NEexp'


scalar NE94 = ne94[1,1]

scalar NErec94 = nerec94[1,1]

scalar NEexp94 = neexp94[1,1]


replace exp = NE94 if highschoolstate == 28 & cohort == 1994

replace rec = NErec94 if highschoolstate == 28 & cohort == 1994

replace expend = NEexp94 if highschoolstate == 28 & cohort == 1994


matrix ne95 = ninetyfive * NE'

matrix nerec95 = ninetyfive * NErec'

matrix neexp95 = ninetyfive * NEexp'


scalar NE95 = ne95[1,1]

scalar NErec95 = nerec95[1,1]

scalar NEexp95 = neexp95[1,1]


replace exp = NE95 if highschoolstate == 28 & cohort == 1995

replace rec = NErec95 if highschoolstate == 28 & cohort == 1995

replace expend = NEexp95 if highschoolstate == 28 & cohort == 1995


matrix ne96 = ninetysix * NE'

matrix nerec96 = ninetysix * NErec'

matrix neexp96 = ninetysix * NEexp'


scalar NE96 = ne96[1,1]

scalar NErec96 = nerec96[1,1]

scalar NEexp96 = neexp96[1,1]


replace exp = NE96 if highschoolstate == 28 & cohort == 1996

replace rec = NErec96 if highschoolstate == 28 & cohort == 1996

replace expend = NEexp96 if highschoolstate == 28 & cohort == 1996


matrix ne97 = ninetyseven * NE'

matrix nerec97 = ninetyseven * NErec'

matrix neexp97 = ninetyseven * NEexp'


scalar NE97 = ne97[1,1]

scalar NErec97 = nerec97[1,1]

scalar NEexp97 = neexp97[1,1]


replace exp = NE97 if highschoolstate == 28 & cohort == 1997

replace rec = NErec97 if highschoolstate == 28 & cohort == 1997

replace expend = NEexp97 if highschoolstate == 28 & cohort == 1997


matrix ne98 = ninetyeight * NE'

matrix nerec98 = ninetyeight * NErec'

matrix neexp98 = ninetyeight * NEexp'


scalar NE98 = ne98[1,1]

scalar NErec98 = nerec98[1,1]

scalar NEexp98 = neexp98[1,1]


replace exp = NE98 if highschoolstate == 28 & cohort == 1998

replace rec = NErec98 if highschoolstate == 28 & cohort == 1998

replace expend = NEexp98 if highschoolstate == 28 & cohort == 1998

*NV|None:29

*NH|None:30

*NJ|None:31

*NM|94-16:32

matrix nm94 = ninetyfour * NM'

matrix nmrec94 = ninetyfour * NMrec'

matrix nmexp94 = ninetyfour * NMexp'


scalar NM94 = nm94[1,1]

scalar NMrec94 = nmrec94[1,1]

scalar NMexp94 = nmexp94[1,1]


replace exp = NM94 if highschoolstate == 32 & cohort == 1994

replace rec = NMrec94 if highschoolstate == 32 & cohort == 1994

replace expend = NMexp94 if highschoolstate == 32 & cohort == 1994


matrix nm95 = ninetyfive * NM'

matrix nmrec95 = ninetyfive * NMrec'

matrix nmexp95 = ninetyfive * NMexp'


scalar NM95 = nm95[1,1]

scalar NMrec95 = nmrec95[1,1]

scalar NMexp95 = nmexp95[1,1]


replace exp = NM95 if highschoolstate == 32 & cohort == 1995

replace rec = NMrec95 if highschoolstate == 32 & cohort == 1995

replace expend = NMexp95 if highschoolstate == 32 & cohort == 1995


matrix nm96 = ninetysix * NM'

matrix nmrec96 = ninetysix * NMrec'

matrix nmexp96 = ninetysix * NMexp'


scalar NM96 = nm96[1,1]

scalar NMrec96 = nmrec96[1,1]

scalar NMexp96 = nmexp96[1,1]


replace exp = NM96 if highschoolstate == 32 & cohort == 1996

replace rec = NMrec96 if highschoolstate == 32 & cohort == 1996

replace expend = NMexp96 if highschoolstate == 32 & cohort == 1996


matrix nm97 = ninetyseven * NM'

matrix nmrec97 = ninetyseven * NMrec'

matrix nmexp97 = ninetyseven * NMexp'


scalar NM97 = nm97[1,1]

scalar NMrec97 = nmrec97[1,1]

scalar NMexp97 = nmexp97[1,1]


replace exp = NM97 if highschoolstate == 32 & cohort == 1997

replace rec = NMrec97 if highschoolstate == 32 & cohort == 1997

replace expend = NMexp97 if highschoolstate == 32 & cohort == 1997


matrix nm98 = ninetyeight * NM'

matrix nmrec98 = ninetyeight * NMrec'

matrix nmexp98 = ninetyeight * NMexp'


scalar NM98 = nm98[1,1]

scalar NMrec98 = nmrec98[1,1]

scalar NMexp98 = nmexp98[1,1]


replace exp = NM98 if highschoolstate == 32 & cohort == 1998

replace rec = NMrec98 if highschoolstate == 32 & cohort == 1998

replace expend = NMexp98 if highschoolstate == 32 & cohort == 1998

*NY|00-16:33

matrix ny94 = ninetyfour * NY'

matrix nyrec94 = ninetyfour * NYrec'

matrix nyexp94 = ninetyfour * NYexp'


scalar NY94 = ny94[1,1]

scalar NYrec94 = nyrec94[1,1]

scalar NYexp94 = nyexp94[1,1]


replace exp = NY94 if highschoolstate == 33 & cohort == 1994

replace rec = NYrec94 if highschoolstate == 33 & cohort == 1994

replace expend = NYexp94 if highschoolstate == 33 & cohort == 1994


matrix ny95 = ninetyfive * NY'

matrix nyrec95 = ninetyfive * NYrec'

matrix nyexp95 = ninetyfive * NYexp'


scalar NY95 = ny95[1,1]

scalar NYrec95 = nyrec95[1,1]

scalar NYexp95 = nyexp95[1,1]


replace exp = NY95 if highschoolstate == 33 & cohort == 1995

replace rec = NYrec95 if highschoolstate == 33 & cohort == 1995

replace expend = NYexp95 if highschoolstate == 33 & cohort == 1995


matrix ny96 = ninetysix * NY'

matrix nyrec96 = ninetysix * NYrec'

matrix nyexp96 = ninetysix * NYexp'


scalar NY96 = ny96[1,1]

scalar NYrec96 = nyrec96[1,1]

scalar NYexp96 = nyexp96[1,1]


replace exp = NY96 if highschoolstate == 33 & cohort == 1996

replace rec = NYrec96 if highschoolstate == 33 & cohort == 1996

replace expend = NYexp96 if highschoolstate == 33 & cohort == 1996


matrix ny97 = ninetyseven * NY'

matrix nyrec97 = ninetyseven * NYrec'

matrix nyexp97 = ninetyseven * NYexp'


scalar NY97 = ny97[1,1]

scalar NYrec97 = nyrec97[1,1]

scalar NYexp97 = nyexp97[1,1]


replace exp = NY97 if highschoolstate == 33 & cohort == 1997

replace rec = NYrec97 if highschoolstate == 33 & cohort == 1997

replace expend = NYexp97 if highschoolstate == 33 & cohort == 1997


matrix ny98 = ninetyeight * NY'

matrix nyrec98 = ninetyeight * NYrec'

matrix nyexp98 = ninetyeight * NYexp'


scalar NY98 = ny98[1,1]

scalar NYrec98 = nyrec98[1,1]

scalar NYexp98 = nyexp98[1,1]


replace exp = NY98 if highschoolstate == 33 & cohort == 1998

replace rec = NYrec98 if highschoolstate == 33 & cohort == 1998

replace expend = NYexp98 if highschoolstate == 33 & cohort == 1998

*NC|01-14:34

matrix nc94 = ninetyfour * NC'

matrix ncrec94 = ninetyfour * NCrec'

matrix ncexp94 = ninetyfour * NCexp'


scalar NC94 = nc94[1,1]

scalar NCrec94 = ncrec94[1,1]

scalar NCexp94 = ncexp94[1,1]


replace exp = NC94 if highschoolstate == 34 & cohort == 1994

replace rec = NCrec94 if highschoolstate == 34 & cohort == 1994

replace expend = NCexp94 if highschoolstate == 34 & cohort == 1994


matrix nc95 = ninetyfive * NC'

matrix ncrec95 = ninetyfive * NCrec'

matrix ncexp95 = ninetyfive * NCexp'


scalar NC95 = nc95[1,1]

scalar NCrec95 = ncrec95[1,1]

scalar NCexp95 = ncexp95[1,1]


replace exp = NC95 if highschoolstate == 34 & cohort == 1995

replace rec = NCrec95 if highschoolstate == 34 & cohort == 1995

replace expend = NCexp95 if highschoolstate == 34 & cohort == 1995


matrix nc96 = ninetysix * NC'

matrix ncrec96 = ninetysix * NCrec'

matrix ncexp96 = ninetysix * NCexp'


scalar NC96 = nc96[1,1]

scalar NCrec96 = ncrec96[1,1]

scalar NCexp96 = ncexp96[1,1]


replace exp = NC96 if highschoolstate == 34 & cohort == 1996

replace rec = NCrec96 if highschoolstate == 34 & cohort == 1996

replace expend = NCexp96 if highschoolstate == 34 & cohort == 1996


matrix nc97 = ninetyseven * NC'

matrix ncrec97 = ninetyseven * NCrec'

matrix ncexp97 = ninetyseven * NCexp'


scalar NC97 = nc97[1,1]

scalar NCrec97 = ncrec97[1,1]

scalar NCexp97 = ncexp97[1,1]


replace exp = NC97 if highschoolstate == 34 & cohort == 1997

replace rec = NCrec97 if highschoolstate == 34 & cohort == 1997

replace expend = NCexp97 if highschoolstate == 34 & cohort == 1997


matrix nc98 = ninetyeight * NC'

matrix ncrec98 = ninetyeight * NCrec'

matrix ncexp98 = ninetyeight * NCexp'


scalar NC98 = nc98[1,1]

scalar NCrec98 = ncrec98[1,1]

scalar NCexp98 = ncexp98[1,1]


replace exp = NC98 if highschoolstate == 34 & cohort == 1998

replace rec = NCrec98 if highschoolstate == 34 & cohort == 1998

replace expend = NCexp98 if highschoolstate == 34 & cohort == 1998

*ND|01-14:35

matrix nd94 = ninetyfour * ND'

matrix ndrec94 = ninetyfour * NDrec'

matrix ndexp94 = ninetyfour * NDexp'


scalar ND94 = nd94[1,1]

scalar NDrec94 = ndrec94[1,1]

scalar NDexp94 = ndexp94[1,1]


replace exp = ND94 if highschoolstate == 35 & cohort == 1994

replace rec = NDrec94 if highschoolstate == 35 & cohort == 1994

replace expend = NDexp94 if highschoolstate == 35 & cohort == 1994


matrix nd95 = ninetyfive * ND'

matrix ndrec95 = ninetyfive * NDrec'

matrix ndexp95 = ninetyfive * NDexp'


scalar ND95 = nd95[1,1]

scalar NDrec95 = ndrec95[1,1]

scalar NDexp95 = ndexp95[1,1]


replace exp = ND95 if highschoolstate == 35 & cohort == 1995

replace rec = NDrec95 if highschoolstate == 35 & cohort == 1995

replace expend = NDexp95 if highschoolstate == 35 & cohort == 1995


matrix nd96 = ninetysix * ND'

matrix ndrec96 = ninetysix * NDrec'

matrix ndexp96 = ninetysix * NDexp'


scalar ND96 = nd96[1,1]

scalar NDrec96 = ndrec96[1,1]

scalar NDexp96 = ndexp96[1,1]


replace exp = ND96 if highschoolstate == 35 & cohort == 1996

replace rec = NDrec96 if highschoolstate == 35 & cohort == 1996

replace expend = NDexp96 if highschoolstate == 35 & cohort == 1996


matrix nd97 = ninetyseven * ND'

matrix ndrec97 = ninetyseven * NDrec'

matrix ndexp97 = ninetyseven * NDexp'


scalar ND97 = nd97[1,1]

scalar NDrec97 = ndrec97[1,1]

scalar NDexp97 = ndexp97[1,1]


replace exp = ND97 if highschoolstate == 35 & cohort == 1997

replace rec = NDrec97 if highschoolstate == 35 & cohort == 1997

replace expend = NDexp97 if highschoolstate == 35 & cohort == 1997


matrix nd98 = ninetyeight * ND'

matrix ndrec98 = ninetyeight * NDrec'

matrix ndexp98 = ninetyeight * NDexp'


scalar ND98 = nd98[1,1]

scalar NDrec98 = ndrec98[1,1]

scalar NDexp98 = ndexp98[1,1]


replace exp = ND98 if highschoolstate == 35 & cohort == 1998

replace rec = NDrec98 if highschoolstate == 35 & cohort == 1998

replace expend = NDexp98 if highschoolstate == 35 & cohort == 1998

*OH|09-16:36

matrix oh94 = ninetyfour * OH'

matrix ohrec94 = ninetyfour * OHrec'

matrix ohexp94 = ninetyfour * OHexp'


scalar OH94 = oh94[1,1]

scalar OHrec94 = ohrec94[1,1]

scalar OHexp94 = ohexp94[1,1]


replace exp = OH94 if highschoolstate == 36 & cohort == 1994

replace rec = OHrec94 if highschoolstate == 36 & cohort == 1994

replace expend = OHexp94 if highschoolstate == 36 & cohort == 1994


matrix oh95 = ninetyfive * OH'

matrix ohrec95 = ninetyfive * OHrec'

matrix ohexp95 = ninetyfive * OHexp'


scalar OH95 = oh95[1,1]

scalar OHrec95 = ohrec95[1,1]

scalar OHexp95 = ohexp95[1,1]


replace exp = OH95 if highschoolstate == 36 & cohort == 1995

replace rec = OHrec95 if highschoolstate == 36 & cohort == 1995

replace expend = OHexp95 if highschoolstate == 36 & cohort == 1995


matrix oh96 = ninetysix * OH'

matrix ohrec96 = ninetysix * OHrec'

matrix ohexp96 = ninetysix * OHexp'


scalar OH96 = oh96[1,1]

scalar OHrec96 = ohrec96[1,1]

scalar OHexp96 = ohexp96[1,1]


replace exp = OH96 if highschoolstate == 36 & cohort == 1996

replace rec = OHrec96 if highschoolstate == 36 & cohort == 1996

replace expend = OHexp96 if highschoolstate == 36 & cohort == 1996


matrix oh97 = ninetyseven * OH'

matrix ohrec97 = ninetyseven * OHrec'

matrix ohexp97 = ninetyseven * OHexp'


scalar OH97 = oh97[1,1]

scalar OHrec97 = ohrec97[1,1]

scalar OHexp97 = ohexp97[1,1]


replace exp = OH97 if highschoolstate == 36 & cohort == 1997

replace rec = OHrec97 if highschoolstate == 36 & cohort == 1997

replace expend = OHexp97 if highschoolstate == 36 & cohort == 1997


matrix oh98 = ninetyeight * OH'

matrix ohrec98 = ninetyeight * OHrec'

matrix ohexp98 = ninetyeight * OHexp'


scalar OH98 = oh98[1,1]

scalar OHrec98 = ohrec98[1,1]

scalar OHexp98 = ohexp98[1,1]


replace exp = OH98 if highschoolstate == 36 & cohort == 1998

replace rec = OHrec98 if highschoolstate == 36 & cohort == 1998

replace expend = OHexp98 if highschoolstate == 36 & cohort == 1998

*OK|85-16:37

matrix ok94 = ninetyfour * OK'

matrix okrec94 = ninetyfour * OKrec'

matrix okexp94 = ninetyfour * OKexp'


scalar OK94 = ok94[1,1]

scalar OKrec94 = okrec94[1,1]

scalar OKexp94 = okexp94[1,1]


replace exp = OK94 if highschoolstate == 37 & cohort == 1994

replace rec = OKrec94 if highschoolstate == 37 & cohort == 1994

replace expend = OKexp94 if highschoolstate == 37 & cohort == 1994


matrix ok95 = ninetyfive * OK'

matrix okrec95 = ninetyfive * OKrec'

matrix okexp95 = ninetyfive * OKexp'


scalar OK95 = ok95[1,1]

scalar OKrec95 = okrec95[1,1]

scalar OKexp95 = okexp95[1,1]


replace exp = OK95 if highschoolstate == 37 & cohort == 1995

replace rec = OKrec95 if highschoolstate == 37 & cohort == 1995

replace expend = OKexp95 if highschoolstate == 37 & cohort == 1995


matrix ok96 = ninetysix * OK'

matrix okrec96 = ninetysix * OKrec'

matrix okexp96 = ninetysix * OKexp'


scalar OK96 = ok96[1,1]

scalar OKrec96 = okrec96[1,1]

scalar OKexp96 = okexp96[1,1]


replace exp = OK96 if highschoolstate == 37 & cohort == 1996

replace rec = OKrec96 if highschoolstate == 37 & cohort == 1996

replace expend = OKexp96 if highschoolstate == 37 & cohort == 1996


matrix ok97 = ninetyseven * OK'

matrix okrec97 = ninetyseven * OKrec'

matrix okexp97 = ninetyseven * OKexp'


scalar OK97 = ok97[1,1]

scalar OKrec97 = okrec97[1,1]

scalar OKexp97 = okexp97[1,1]


replace exp = OK97 if highschoolstate == 37 & cohort == 1997

replace rec = OKrec97 if highschoolstate == 37 & cohort == 1997

replace expend = OKexp97 if highschoolstate == 37 & cohort == 1997


matrix ok98 = ninetyeight * OK'

matrix okrec98 = ninetyeight * OKrec'

matrix okexp98 = ninetyeight * OKexp'


scalar OK98 = ok98[1,1]

scalar OKrec98 = okrec98[1,1]

scalar OKexp98 = okexp98[1,1]


replace exp = OK98 if highschoolstate == 37 & cohort == 1998

replace rec = OKrec98 if highschoolstate == 37 & cohort == 1998

replace expend = OKexp98 if highschoolstate == 37 & cohort == 1998

*OR|None:38

*PA|84-08:39

matrix pa94 = ninetyfour * PA'

matrix parec94 = ninetyfour * PArec'

matrix paexp94 = ninetyfour * PAexp'


scalar PA94 = pa94[1,1]

scalar PArec94 = parec94[1,1]

scalar PAexp94 = paexp94[1,1]


replace exp = PA94 if highschoolstate == 39 & cohort == 1994

replace rec = PArec94 if highschoolstate == 39 & cohort == 1994

replace expend = PAexp94 if highschoolstate == 39 & cohort == 1994


matrix pa95 = ninetyfive * PA'

matrix parec95 = ninetyfive * PArec'

matrix paexp95 = ninetyfive * PAexp'


scalar PA95 = pa95[1,1]

scalar PArec95 = parec95[1,1]

scalar PAexp95 = paexp95[1,1]


replace exp = PA95 if highschoolstate == 39 & cohort == 1995

replace rec = PArec95 if highschoolstate == 39 & cohort == 1995

replace expend = PAexp95 if highschoolstate == 39 & cohort == 1995


matrix pa96 = ninetysix * PA'

matrix parec96 = ninetysix * PArec'

matrix paexp96 = ninetysix * PAexp'


scalar PA96 = pa96[1,1]

scalar PArec96 = parec96[1,1]

scalar PAexp96 = paexp96[1,1]


replace exp = PA96 if highschoolstate == 39 & cohort == 1996

replace rec = PArec96 if highschoolstate == 39 & cohort == 1996

replace expend = PAexp96 if highschoolstate == 39 & cohort == 1996


matrix pa97 = ninetyseven * PA'

matrix parec97 = ninetyseven * PArec'

matrix paexp97 = ninetyseven * PAexp'


scalar PA97 = pa97[1,1]

scalar PArec97 = parec97[1,1]

scalar PAexp97 = paexp97[1,1]


replace exp = PA97 if highschoolstate == 39 & cohort == 1997

replace rec = PArec97 if highschoolstate == 39 & cohort == 1997

replace expend = PAexp97 if highschoolstate == 39 & cohort == 1997


matrix pa98 = ninetyeight * PA'

matrix parec98 = ninetyeight * PArec'

matrix paexp98 = ninetyeight * PAexp'


scalar PA98 = pa98[1,1]

scalar PArec98 = parec98[1,1]

scalar PAexp98 = paexp98[1,1]


replace exp = PA98 if highschoolstate == 39 & cohort == 1998

replace rec = PArec98 if highschoolstate == 39 & cohort == 1998

replace expend = PAexp98 if highschoolstate == 39 & cohort == 1998

*RI|None:40

*SC|84-16:41

matrix sc94 = ninetyfour * SC'

matrix screc94 = ninetyfour * SCrec'

matrix scexp94 = ninetyfour * SCexp'


scalar SC94 = sc94[1,1]

scalar SCrec94 = screc94[1,1]

scalar SCexp94 = scexp94[1,1]


replace exp = SC94 if highschoolstate == 41 & cohort == 1994

replace rec = SCrec94 if highschoolstate == 41 & cohort == 1994

replace expend = SCexp94 if highschoolstate == 41 & cohort == 1994


matrix sc95 = ninetyfive * SC'

matrix screc95 = ninetyfive * SCrec'

matrix scexp95 = ninetyfive * SCexp'


scalar SC95 = sc95[1,1]

scalar SCrec95 = screc95[1,1]

scalar SCexp95 = scexp95[1,1]


replace exp = SC95 if highschoolstate == 41 & cohort == 1995

replace rec = SCrec95 if highschoolstate == 41 & cohort == 1995

replace expend = SCexp95 if highschoolstate == 41 & cohort == 1995


matrix sc96 = ninetysix * SC'

matrix screc96 = ninetysix * SCrec'

matrix scexp96 = ninetysix * SCexp'


scalar SC96 = sc96[1,1]

scalar SCrec96 = screc96[1,1]

scalar SCexp96 = scexp96[1,1]


replace exp = SC96 if highschoolstate == 41 & cohort == 1996

replace rec = SCrec96 if highschoolstate == 41 & cohort == 1996

replace expend = SCexp96 if highschoolstate == 41 & cohort == 1996


matrix sc97 = ninetyseven * SC'

matrix screc97 = ninetyseven * SCrec'

matrix scexp97 = ninetyseven * SCexp'


scalar SC97 = sc97[1,1]

scalar SCrec97 = screc97[1,1]

scalar SCexp97 = scexp97[1,1]


replace exp = SC97 if highschoolstate == 41 & cohort == 1997

replace rec = SCrec97 if highschoolstate == 41 & cohort == 1997

replace expend = SCexp97 if highschoolstate == 41 & cohort == 1997


matrix sc98 = ninetyeight * SC'

matrix screc98 = ninetyeight * SCrec'

matrix scexp98 = ninetyeight * SCexp'


scalar SC98 = sc98[1,1]

scalar SCrec98 = screc98[1,1]

scalar SCexp98 = scexp98[1,1]


replace exp = SC98 if highschoolstate == 41 & cohort == 1998

replace rec = SCrec98 if highschoolstate == 41 & cohort == 1998

replace expend = SCexp98 if highschoolstate == 41 & cohort == 1998

*SD|03-16:42

matrix sd94 = ninetyfour * SD'

matrix sdrec94 = ninetyfour * SDrec'

matrix sdexp94 = ninetyfour * SDexp'


scalar SD94 = sd94[1,1]

scalar SDrec94 = sdrec94[1,1]

scalar SDexp94 = sdexp94[1,1]


replace exp = SD94 if highschoolstate == 42 & cohort == 1994

replace rec = SDrec94 if highschoolstate == 42 & cohort == 1994

replace expend = SDexp94 if highschoolstate == 42 & cohort == 1994


matrix sd95 = ninetyfive * SD'

matrix sdrec95 = ninetyfive * SDrec'

matrix sdexp95 = ninetyfive * SDexp'


scalar SD95 = sd95[1,1]

scalar SDrec95 = sdrec95[1,1]

scalar SDexp95 = sdexp95[1,1]


replace exp = SD95 if highschoolstate == 42 & cohort == 1995

replace rec = SDrec95 if highschoolstate == 42 & cohort == 1995

replace expend = SDexp95 if highschoolstate == 42 & cohort == 1995


matrix sd96 = ninetysix * SD'

matrix sdrec96 = ninetysix * SDrec'

matrix sdexp96 = ninetysix * SDexp'


scalar SD96 = sd96[1,1]

scalar SDrec96 = sdrec96[1,1]

scalar SDexp96 = sdexp96[1,1]


replace exp = SD96 if highschoolstate == 42 & cohort == 1996

replace rec = SDrec96 if highschoolstate == 42 & cohort == 1996

replace expend = SDexp96 if highschoolstate == 42 & cohort == 1996


matrix sd97 = ninetyseven * SD'

matrix sdrec97 = ninetyseven * SDrec'

matrix sdexp97 = ninetyseven * SDexp'


scalar SD97 = sd97[1,1]

scalar SDrec97 = sdrec97[1,1]

scalar SDexp97 = sdexp97[1,1]


replace exp = SD97 if highschoolstate == 42 & cohort == 1997

replace rec = SDrec97 if highschoolstate == 42 & cohort == 1997

replace expend = SDexp97 if highschoolstate == 42 & cohort == 1997


matrix sd98 = ninetyeight * SD'

matrix sdrec98 = ninetyeight * SDrec'

matrix sdexp98 = ninetyeight * SDexp'


scalar SD98 = sd98[1,1]

scalar SDrec98 = sdrec98[1,1]

scalar SDexp98 = sdexp98[1,1]


replace exp = SD98 if highschoolstate == 42 & cohort == 1998

replace rec = SDrec98 if highschoolstate == 42 & cohort == 1998

replace expend = SDexp98 if highschoolstate == 42 & cohort == 1998

*TN|91-14:43

matrix tn94 = ninetyfour * TN'

matrix tnrec94 = ninetyfour * TNrec'

matrix tnexp94 = ninetyfour * TNexp'


scalar TN94 = tn94[1,1]

scalar TNrec94 = tnrec94[1,1]

scalar TNexp94 = tnexp94[1,1]


replace exp = TN94 if highschoolstate == 43 & cohort == 1994

replace rec = TNrec94 if highschoolstate == 43 & cohort == 1994

replace expend = TNexp94 if highschoolstate == 43 & cohort == 1994


matrix tn95 = ninetyfive * TN'

matrix tnrec95 = ninetyfive * TNrec'

matrix tnexp95 = ninetyfive * TNexp'


scalar TN95 = tn95[1,1]

scalar TNrec95 = tnrec95[1,1]

scalar TNexp95 = tnexp95[1,1]


replace exp = TN95 if highschoolstate == 43 & cohort == 1995

replace rec = TNrec95 if highschoolstate == 43 & cohort == 1995

replace expend = TNexp95 if highschoolstate == 43 & cohort == 1995


matrix tn96 = ninetysix * TN'

matrix tnrec96 = ninetysix * TNrec'

matrix tnexp96 = ninetysix * TNexp'


scalar TN96 = tn96[1,1]

scalar TNrec96 = tnrec96[1,1]

scalar TNexp96 = tnexp96[1,1]


replace exp = TN96 if highschoolstate == 43 & cohort == 1996

replace rec = TNrec96 if highschoolstate == 43 & cohort == 1996

replace expend = TNexp96 if highschoolstate == 43 & cohort == 1996


matrix tn97 = ninetyseven * TN'

matrix tnrec97 = ninetyseven * TNrec'

matrix tnexp97 = ninetyseven * TNexp'


scalar TN97 = tn97[1,1]

scalar TNrec97 = tnrec97[1,1]

scalar TNexp97 = tnexp97[1,1]


replace exp = TN97 if highschoolstate == 43 & cohort == 1997

replace rec = TNrec97 if highschoolstate == 43 & cohort == 1997

replace expend = TNexp97 if highschoolstate == 43 & cohort == 1997


matrix tn98 = ninetyeight * TN'

matrix tnrec98 = ninetyeight * TNrec'

matrix tnexp98 = ninetyeight * TNexp'


scalar TN98 = tn98[1,1]

scalar TNrec98 = tnrec98[1,1]

scalar TNexp98 = tnexp98[1,1]


replace exp = TN98 if highschoolstate == 43 & cohort == 1998

replace rec = TNrec98 if highschoolstate == 43 & cohort == 1998

replace expend = TNexp98 if highschoolstate == 43 & cohort == 1998

*TX|01-16:44

matrix tx94 = ninetyfour * TX'

matrix txrec94 = ninetyfour * TXrec'

matrix txexp94 = ninetyfour * TXexp'


scalar TX94 = tx94[1,1]

scalar TXrec94 = txrec94[1,1]

scalar TXexp94 = txexp94[1,1]


replace exp = TX94 if highschoolstate == 44 & cohort == 1994

replace rec = TXrec94 if highschoolstate == 44 & cohort == 1994

replace expend = TXexp94 if highschoolstate == 44 & cohort == 1994


matrix tx95 = ninetyfive * TX'

matrix txrec95 = ninetyfive * TXrec'

matrix txexp95 = ninetyfive * TXexp'


scalar TX95 = tx95[1,1]

scalar TXrec95 = txrec95[1,1]

scalar TXexp95 = txexp95[1,1]


replace exp = TX95 if highschoolstate == 44 & cohort == 1995

replace rec = TXrec95 if highschoolstate == 44 & cohort == 1995

replace expend = TXexp95 if highschoolstate == 44 & cohort == 1995


matrix tx96 = ninetysix * TX'

matrix txrec96 = ninetysix * TXrec'

matrix txexp96 = ninetysix * TXexp'


scalar TX96 = tx96[1,1]

scalar TXrec96 = txrec96[1,1]

scalar TXexp96 = txexp96[1,1]


replace exp = TX96 if highschoolstate == 44 & cohort == 1996

replace rec = TXrec96 if highschoolstate == 44 & cohort == 1996

replace expend = TXexp96 if highschoolstate == 44 & cohort == 1996


matrix tx97 = ninetyseven * TX'

matrix txrec97 = ninetyseven * TXrec'

matrix txexp97 = ninetyseven * TXexp'


scalar TX97 = tx97[1,1]

scalar TXrec97 = txrec97[1,1]

scalar TXexp97 = txexp97[1,1]


replace exp = TX97 if highschoolstate == 44 & cohort == 1997

replace rec = TXrec97 if highschoolstate == 44 & cohort == 1997

replace expend = TXexp97 if highschoolstate == 44 & cohort == 1997


matrix tx98 = ninetyeight * TX'

matrix txrec98 = ninetyeight * TXrec'

matrix txexp98 = ninetyeight * TXexp'


scalar TX98 = tx98[1,1]

scalar TXrec98 = txrec98[1,1]

scalar TXexp98 = txexp98[1,1]


replace exp = TX98 if highschoolstate == 44 & cohort == 1998

replace rec = TXrec98 if highschoolstate == 44 & cohort == 1998

replace expend = TXexp98 if highschoolstate == 44 & cohort == 1998

*UT|96-16:45

matrix ut94 = ninetyfour * UT'

matrix utrec94 = ninetyfour * UTrec'

matrix utexp94 = ninetyfour * UTexp'


scalar UT94 = ut94[1,1]

scalar UTrec94 = utrec94[1,1]

scalar UTexp94 = utexp94[1,1]


replace exp = UT94 if highschoolstate == 45 & cohort == 1994

replace rec = UTrec94 if highschoolstate == 45 & cohort == 1994

replace expend = UTexp94 if highschoolstate == 45 & cohort == 1994


matrix ut95 = ninetyfive * UT'

matrix utrec95 = ninetyfive * UTrec'

matrix utexp95 = ninetyfive * UTexp'


scalar UT95 = ut95[1,1]

scalar UTrec95 = utrec95[1,1]

scalar UTexp95 = utexp95[1,1]


replace exp = UT95 if highschoolstate == 45 & cohort == 1995

replace rec = UTrec95 if highschoolstate == 45 & cohort == 1995

replace expend = UTexp95 if highschoolstate == 45 & cohort == 1995


matrix ut96 = ninetysix * UT'

matrix utrec96 = ninetysix * UTrec'

matrix utexp96 = ninetysix * UTexp'


scalar UT96 = ut96[1,1]

scalar UTrec96 = utrec96[1,1]

scalar UTexp96 = utexp96[1,1]


replace exp = UT96 if highschoolstate == 45 & cohort == 1996

replace rec = UTrec96 if highschoolstate == 45 & cohort == 1996

replace expend = UTexp96 if highschoolstate == 45 & cohort == 1996


matrix ut97 = ninetyseven * UT'

matrix utrec97 = ninetyseven * UTrec'

matrix utexp97 = ninetyseven * UTexp'


scalar UT97 = ut97[1,1]

scalar UTrec97 = utrec97[1,1]

scalar UTexp97 = utexp97[1,1]


replace exp = UT97 if highschoolstate == 45 & cohort == 1997

replace rec = UTrec97 if highschoolstate == 45 & cohort == 1997

replace expend = UTexp97 if highschoolstate == 45 & cohort == 1997


matrix ut98 = ninetyeight * UT'

matrix utrec98 = ninetyeight * UTrec'

matrix utexp98 = ninetyeight * UTexp'


scalar UT98 = ut98[1,1]

scalar UTrec98 = utrec98[1,1]

scalar UTexp98 = utexp98[1,1]


replace exp = UT98 if highschoolstate == 45 & cohort == 1998

replace rec = UTrec98 if highschoolstate == 45 & cohort == 1998

replace expend = UTexp98 if highschoolstate == 45 & cohort == 1998

*VT|None:46

*VA|02-14:47

matrix va94 = ninetyfour * VA'

matrix varec94 = ninetyfour * VArec'

matrix vaexp94 = ninetyfour * VAexp'


scalar VA94 = va94[1,1]

scalar VArec94 = varec94[1,1]

scalar VAexp94 = vaexp94[1,1]


replace exp = VA94 if highschoolstate == 47 & cohort == 1994

replace rec = VArec94 if highschoolstate == 47 & cohort == 1994

replace expend = VAexp94 if highschoolstate == 47 & cohort == 1994


matrix va95 = ninetyfive * VA'

matrix varec95 = ninetyfive * VArec'

matrix vaexp95 = ninetyfive * VAexp'


scalar VA95 = va95[1,1]

scalar VArec95 = varec95[1,1]

scalar VAexp95 = vaexp95[1,1]


replace exp = VA95 if highschoolstate == 47 & cohort == 1995

replace rec = VArec95 if highschoolstate == 47 & cohort == 1995

replace expend = VAexp95 if highschoolstate == 47 & cohort == 1995


matrix va96 = ninetysix * VA'

matrix varec96 = ninetysix * VArec'

matrix vaexp96 = ninetysix * VAexp'


scalar VA96 = va96[1,1]

scalar VArec96 = varec96[1,1]

scalar VAexp96 = vaexp96[1,1]


replace exp = VA96 if highschoolstate == 47 & cohort == 1996

replace rec = VArec96 if highschoolstate == 47 & cohort == 1996

replace expend = VAexp96 if highschoolstate == 47 & cohort == 1996


matrix va97 = ninetyseven * VA'

matrix varec97 = ninetyseven * VArec'

matrix vaexp97 = ninetyseven * VAexp'


scalar VA97 = va97[1,1]

scalar VArec97 = varec97[1,1]

scalar VAexp97 = vaexp97[1,1]


replace exp = VA97 if highschoolstate == 47 & cohort == 1997

replace rec = VArec97 if highschoolstate == 47 & cohort == 1997

replace expend = VAexp97 if highschoolstate == 47 & cohort == 1997


matrix va98 = ninetyeight * VA'

matrix varec98 = ninetyeight * VArec'

matrix vaexp98 = ninetyeight * VAexp'


scalar VA98 = va98[1,1]

scalar VArec98 = varec98[1,1]

scalar VAexp98 = vaexp98[1,1]


replace exp = VA98 if highschoolstate == 47 & cohort == 1998

replace rec = VArec98 if highschoolstate == 47 & cohort == 1998

replace expend = VAexp98 if highschoolstate == 47 & cohort == 1998

*WA|83-14:48

matrix wa94 = ninetyfour * WA'

matrix warec94 = ninetyfour * WArec'

matrix waexp94 = ninetyfour * WAexp'


scalar WA94 = wa94[1,1]

scalar WArec94 = warec94[1,1]

scalar WAexp94 = waexp94[1,1]


replace exp = WA94 if highschoolstate == 48 & cohort == 1994

replace rec = WArec94 if highschoolstate == 48 & cohort == 1994

replace expend = WAexp94 if highschoolstate == 48 & cohort == 1994


matrix wa95 = ninetyfive * WA'

matrix warec95 = ninetyfive * WArec'

matrix waexp95 = ninetyfive * WAexp'


scalar WA95 = wa95[1,1]

scalar WArec95 = warec95[1,1]

scalar WAexp95 = waexp95[1,1]


replace exp = WA95 if highschoolstate == 48 & cohort == 1995

replace rec = WArec95 if highschoolstate == 48 & cohort == 1995

replace expend = WAexp95 if highschoolstate == 48 & cohort == 1995


matrix wa96 = ninetysix * WA'

matrix warec96 = ninetysix * WArec'

matrix waexp96 = ninetysix * WAexp'


scalar WA96 = wa96[1,1]

scalar WArec96 = warec96[1,1]

scalar WAexp96 = waexp96[1,1]


replace exp = WA96 if highschoolstate == 48 & cohort == 1996

replace rec = WArec96 if highschoolstate == 48 & cohort == 1996

replace expend = WAexp96 if highschoolstate == 48 & cohort == 1996


matrix wa97 = ninetyseven * WA'

matrix warec97 = ninetyseven * WArec'

matrix waexp97 = ninetyseven * WAexp'


scalar WA97 = wa97[1,1]

scalar WArec97 = warec97[1,1]

scalar WAexp97 = waexp97[1,1]


replace exp = WA97 if highschoolstate == 48 & cohort == 1997

replace rec = WArec97 if highschoolstate == 48 & cohort == 1997

replace expend = WAexp97 if highschoolstate == 48 & cohort == 1997


matrix wa98 = ninetyeight * WA'

matrix warec98 = ninetyeight * WArec'

matrix waexp98 = ninetyeight * WAexp'


scalar WA98 = wa98[1,1]

scalar WArec98 = warec98[1,1]

scalar WAexp98 = waexp98[1,1]


replace exp = WA98 if highschoolstate == 48 & cohort == 1998

replace rec = WArec98 if highschoolstate == 48 & cohort == 1998

replace expend = WAexp98 if highschoolstate == 48 & cohort == 1998

*WV|91-14:49

matrix wv94 = ninetyfour * WV'

matrix wvrec94 = ninetyfour * WVrec'

matrix wvexp94 = ninetyfour * WVexp'


scalar WV94 = wv94[1,1]

scalar WVrec94 = wvrec94[1,1]

scalar WVexp94 = wvexp94[1,1]


replace exp = WV94 if highschoolstate == 49 & cohort == 1994

replace rec = WVrec94 if highschoolstate == 49 & cohort == 1994

replace expend = WVexp94 if highschoolstate == 49 & cohort == 1994


matrix wv95 = ninetyfive * WV'

matrix wvrec95 = ninetyfive * WVrec'

matrix wvexp95 = ninetyfive * WVexp'


scalar WV95 = wv95[1,1]

scalar WVrec95 = wvrec95[1,1]

scalar WVexp95 = wvexp95[1,1]


replace exp = WV95 if highschoolstate == 49 & cohort == 1995

replace rec = WVrec95 if highschoolstate == 49 & cohort == 1995

replace expend = WVexp95 if highschoolstate == 49 & cohort == 1995


matrix wv96 = ninetysix * WV'

matrix wvrec96 = ninetysix * WVrec'

matrix wvexp96 = ninetysix * WVexp'


scalar WV96 = wv96[1,1]

scalar WVrec96 = wvrec96[1,1]

scalar WVexp96 = wvexp96[1,1]


replace exp = WV96 if highschoolstate == 49 & cohort == 1996

replace rec = WVrec96 if highschoolstate == 49 & cohort == 1996

replace expend = WVexp96 if highschoolstate == 49 & cohort == 1996


matrix wv97 = ninetyseven * WV'

matrix wvrec97 = ninetyseven * WVrec'

matrix wvexp97 = ninetyseven * WVexp'


scalar WV97 = wv97[1,1]

scalar WVrec97 = wvrec97[1,1]

scalar WVexp97 = wvexp97[1,1]


replace exp = WV97 if highschoolstate == 49 & cohort == 1997

replace rec = WVrec97 if highschoolstate == 49 & cohort == 1997

replace expend = WVexp97 if highschoolstate == 49 & cohort == 1997


matrix wv98 = ninetyeight * WV'

matrix wvrec98 = ninetyeight * WVrec'

matrix wvexp98 = ninetyeight * WVexp'


scalar WV98 = wv98[1,1]

scalar WVrec98 = wvrec98[1,1]

scalar WVexp98 = wvexp98[1,1]


replace exp = WV98 if highschoolstate == 49 & cohort == 1998

replace rec = WVrec98 if highschoolstate == 49 & cohort == 1998

replace expend = WVexp98 if highschoolstate == 49 & cohort == 1998

*WI|98-14:50

matrix wi94 = ninetyfour * WI'

matrix wirec94 = ninetyfour * WIrec'

matrix wiexp94 = ninetyfour * WIexp'


scalar WI94 = wi94[1,1]

scalar WIrec94 = wirec94[1,1]

scalar WIexp94 = wiexp94[1,1]


replace exp = WI94 if highschoolstate == 50 & cohort == 1994

replace rec = WIrec94 if highschoolstate == 50 & cohort == 1994

replace expend = WIexp94 if highschoolstate == 50 & cohort == 1994


matrix wi95 = ninetyfive * WI'

matrix wirec95 = ninetyfive * WIrec'

matrix wiexp95 = ninetyfive * WIexp'


scalar WI95 = wi95[1,1]

scalar WIrec95 = wirec95[1,1]

scalar WIexp95 = wiexp95[1,1]


replace exp = WI95 if highschoolstate == 50 & cohort == 1995

replace rec = WIrec95 if highschoolstate == 50 & cohort == 1995

replace expend = WIexp95 if highschoolstate == 50 & cohort == 1995


matrix wi96 = ninetysix * WI'

matrix wirec96 = ninetysix * WIrec'

matrix wiexp96 = ninetysix * WIexp'


scalar WI96 = wi96[1,1]

scalar WIrec96 = wirec96[1,1]

scalar WIexp96 = wiexp96[1,1]


replace exp = WI96 if highschoolstate == 50 & cohort == 1996

replace rec = WIrec96 if highschoolstate == 50 & cohort == 1996

replace expend = WIexp96 if highschoolstate == 50 & cohort == 1996


matrix wi97 = ninetyseven * WI'

matrix wirec97 = ninetyseven * WIrec'

matrix wiexp97 = ninetyseven * WIexp'


scalar WI97 = wi97[1,1]

scalar WIrec97 = wirec97[1,1]

scalar WIexp97 = wiexp97[1,1]


replace exp = WI97 if highschoolstate == 50 & cohort == 1997

replace rec = WIrec97 if highschoolstate == 50 & cohort == 1997

replace expend = WIexp97 if highschoolstate == 50 & cohort == 1997


matrix wi98 = ninetyeight * WI'

matrix wirec98 = ninetyeight * WIrec'

matrix wiexp98 = ninetyeight * WIexp'


scalar WI98 = wi98[1,1]

scalar WIrec98 = wirec98[1,1]

scalar WIexp98 = wiexp98[1,1]


replace exp = WI98 if highschoolstate == 50 & cohort == 1998

replace rec = WIrec98 if highschoolstate == 50 & cohort == 1998

replace expend = WIexp98 if highschoolstate == 50 & cohort == 1998

*WY|97-15:51

matrix wy94 = ninetyfour * WY'

matrix wyrec94 = ninetyfour * WYrec'

matrix wyexp94 = ninetyfour * WYexp'


scalar WY94 = wy94[1,1]

scalar WYrec94 = wyrec94[1,1]

scalar WYexp94 = wyexp94[1,1]


replace exp = WY94 if highschoolstate == 51 & cohort == 1994

replace rec = WYrec94 if highschoolstate == 51 & cohort == 1994

replace expend = WYexp94 if highschoolstate == 51 & cohort == 1994


matrix wy95 = ninetyfive * WY'

matrix wyrec95 = ninetyfive * WYrec'

matrix wyexp95 = ninetyfive * WYexp'


scalar WY95 = wy95[1,1]

scalar WYrec95 = wyrec95[1,1]

scalar WYexp95 = wyexp95[1,1]


replace exp = WY95 if highschoolstate == 51 & cohort == 1995

replace rec = WYrec95 if highschoolstate == 51 & cohort == 1995

replace expend = WYexp95 if highschoolstate == 51 & cohort == 1995


matrix wy96 = ninetysix * WY'

matrix wyrec96 = ninetysix * WYrec'

matrix wyexp96 = ninetysix * WYexp'


scalar WY96 = wy96[1,1]

scalar WYrec96 = wyrec96[1,1]

scalar WYexp96 = wyexp96[1,1]


replace exp = WY96 if highschoolstate == 51 & cohort == 1996

replace rec = WYrec96 if highschoolstate == 51 & cohort == 1996

replace expend = WYexp96 if highschoolstate == 51 & cohort == 1996


matrix wy97 = ninetyseven * WY'

matrix wyrec97 = ninetyseven * WYrec'

matrix wyexp97 = ninetyseven * WYexp'


scalar WY97 = wy97[1,1]

scalar WYrec97 = wyrec97[1,1]

scalar WYexp97 = wyexp97[1,1]


replace exp = WY97 if highschoolstate == 51 & cohort == 1997

replace rec = WYrec97 if highschoolstate == 51 & cohort == 1997

replace expend = WYexp97 if highschoolstate == 51 & cohort == 1997


matrix wy98 = ninetyeight * WY'

matrix wyrec98 = ninetyeight * WYrec'

matrix wyexp98 = ninetyeight * WYexp'


scalar WY98 = wy98[1,1]

scalar WYrec98 = wyrec98[1,1]

scalar WYexp98 = wyexp98[1,1]


replace exp = WY98 if highschoolstate == 51 & cohort == 1998

replace rec = WYrec98 if highschoolstate == 51 & cohort == 1998

replace expend = WYexp98 if highschoolstate == 51 & cohort == 1998

*create dummy variables for state and cohort fixed effects 

tab highschoolstate, gen (s)

tab cohort, gen (c)

*rename variables to make analysis easier 

rename cohort hscohort 

rename sex biosex

rename sampletype typeofsample

*save final dataset

save "SATMathIncRankQuantFinalDatasetInstruments.dta"

log close 







