
clear all

** Install all the packages used to run this do-file**
*1. To install the asdoc for producing Table 1*
ssc install asdoc

*2. To install the x_ols.ado file for the Conley Standard Error results in Table 3, please to download the ado file 
* from https://economics.uwo.ca/people/conley_docs/data_GMMWithCross_99/x_ols.ado, and manually add it to the ado\plus directory on your computer. 

*install the st0030_3 package from http://www.stata-journal.com/software/sj7-4 for Table 5*
findit ranktest 

*install the packages sg162 and regsave for Table A1*
findit spatwmat
ssc install regsave


** Figure 1 **
use census10_final.dta, clear
twoway (scatter lneduyear lnjinshipop, msymbol(circle_hollow) mcolor(black) msize(med)) ///
       (lfit lneduyear lnjinshipop, lcolor(black)), graphregion(color(white)) legend(off) ///
        xtitle("Jinshi Density (Ming-Qing, Logged)") ytitle("Average Year of Schooling (2010, Logged)") 

** Figure 2 **
use figure2.dta, clear
twoway (rcap cl ch p, lstyle(ci) lpattern(shortdash)) (connected Beta p, lcolor(black) mcolor(black)), ///
        xline(1.5 2.5 7.2, lcolor(gs14)) yline(0, lcolor(gs14)) xlabel(1 "Song(960-1279)" 2 "Yuan(1271-1368)" ///
		3 "1371-1450" 4 "1451-1500" 5 "1501-1550" 6 "1551-1600" 7 "1601-1650" 8 "1651-1700" 9 "1701-1750" ///
		10 "1751-1800" 11 "1801-1850" 12 "1851-1904", angle(45) labs(small)) ylabel(, nogrid) graphregion(color(white)) ///
        xtitle("") ytitle("Coefficients of Jinshi Density on" "Years of Schooling in 2010", size(med)) 

** Figure 4 **
use figure4.dta, clear
twoway (rcap cl ch p, lstyle(ci) lpattern(shortdash)) (connected Beta p, lcolor(black) mcolor(black)), ///
        xline(2.1 3.7 3.9 6.1 10.3 11.3, lcolor(gs14)) yline(0, lcolor(gs14)) xlabel(1 "960-1279"  ///
		2 "1371-1450" 3 "1451-1500" 4 "1501-1550" 5 "1551-1600" 6 "1601-1650" 7 "1651-1700" 8 "1701-1750" ///
		9 "1751-1800" 10 "1801-1850" 11 "1851-1904", angle(45) labs(small)) ylabel(, nogrid) graphregion(color(white)) ///
        xtitle("") ytitle("Coefficients of River Distance to Pine" "and Bamboo Locations on Jinshi Density", size(med)) 




** Table 1 **
use census10_final.dta, clear
asdoc tabstat lneduyear lnnspop lnmppop lnhighpop lnunipop lnjinshipop lnjurenpop lnshengyuanpop ///
        lnnightlight lncoastdist tri suitability lnpopdensity urbanrates bprvdist rvrdist ///
		lnprint pcenter lnacademis lnschool1900 lnuni1947 lnschool2010 lnuni2010 lnclanpop ///
		lncharitable1840 lnorg1935 lnorg2008 lnofficialqing lnofficialrp lnccm2148 lnccm4977 lnccm7817 ///
		, stat(N mean sd min max) label

				
** Table 2 **
eststo clear
set more off
eststo: xi: reg lneduyear lnjinshipop i.provid, r cl(provid)
eststo: xi: reg lneduyear lnjinshipop lnnightlight lncoastdist tri i.provid, r cl(provid)
eststo: xi: reg lneduyear lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lneduyear lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnnspop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnmppop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnhighpop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnunipop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
esttab using table2.csv, b(%12.3fc) label se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates) order(lnjinshipop lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates) replace

* Conley Standard Error *
gen const=1
gen cutoff1=1
gen cutoff2=1
xi: x_ols x y cutoff1 cutoff2 lneduyear const lnjinshipop i.prov, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lneduyear const lnjinshipop lnnightlight lncoastdist tri i.provid, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lneduyear const lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lneduyear const lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lnnspop const lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lnmppop const lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lnhighpop const lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, xreg(26) coord(2) 
drop epsilon - dis2
xi: x_ols x y cutoff1 cutoff2 lnunipop const lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, xreg(26) coord(2) 
drop epsilon - dis2


** Table 3 **
eststo clear
set more off
eststo: xi: reg lneduyear lnjurenpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lneduyear lnshengyuanpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lneduyear lnjinshipop lnjurenpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lneduyear lnjinshipop lnjurenpop lnshengyuanpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnnspop lnjinshipop lnjurenpop lnshengyuanpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnmppop lnjinshipop lnjurenpop lnshengyuanpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnhighpop lnjinshipop lnjurenpop lnshengyuanpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnunipop lnjinshipop lnjurenpop lnshengyuanpop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
esttab using table3.csv, b(%12.3fc) label se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop lnjurenpop lnshengyuanpop) order(lnjinshipop lnjurenpop lnshengyuanpop) replace


** Table 4 **
eststo clear
set more off
eststo: xi: reg lnjinshipop lnprint i.provid, r cl(provid)
eststo: xi: reg lnjinshipop lnprint lnnightlight lncoastdist tri i.provid, r cl(provid)
eststo: xi: reg pcenter bprvdist i.provid, r cl(provid)
eststo: xi: reg pcenter bprvdist lnnightlight lncoastdist tri i.provid, r cl(provid)
eststo: xi: reg lnprint bprvdist i.provid, r cl(provid)
eststo: xi: reg lnprint bprvdist lnnightlight lncoastdist tri i.provid, r cl(provid)
eststo: xi: reg lnjinshipop bprvdist i.provid, r cl(provid)
eststo: xi: reg lnjinshipop bprvdist lnnightlight lncoastdist tri i.provid, r cl(provid)
esttab using table4.csv, b(%12.3fc) se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnprint bprvdist) order(lnprint bprvdist) replace


** Table 5 **
eststo clear
set more off 
eststo: xi: reg lneduyear bprvdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lneduyear bprvdist rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnhighpop bprvdist rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnunipop bprvdist rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)

eststo: xi: ivreg2 lnjinshipop bprvdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r first cl(provid)
eststo: xi: ivreg2 lnjinshipop bprvdist rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r first cl(provid)

eststo: xi: ivreg2 lneduyear (lnjinshipop=bprvdist) lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r first cl(provid)
eststo: xi: ivreg2 lneduyear (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r first cl(provid)
eststo: xi: ivreg2 lnhighpop (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r first cl(provid)
eststo: xi: ivreg2 lnunipop (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r first cl(provid)
esttab using table5.csv, b(%12.3fc) se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop bprvdist rvrdist) order(lnjinshipop bprvdist rvrdist) replace


** Table 6 **
/* Tables 6 use the confidential surname and location information in the China Family Panel Studies. 
According to the data access policy of the Institute of Social Science Survey, such data could only be 
accessed on-site in the Institute. */


** Table 7 **
eststo clear
set more off 
eststo: xi: reg lnacademis lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnacademis (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnschool1900 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnschool1900 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnuni1947 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnuni1947 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnschool2010 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnschool2010 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnuni2010 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnuni2010 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
esttab using table7.csv, b(%12.3fc) label se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop rvrdist) order(lnjinshipop rvrdist) replace


** Table 8 **
eststo clear
set more off
eststo: xi: reg lnclan lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnclan (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lncharitable1840 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lncharitable1840 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnorg1935 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnorg1935 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnorg2008 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnorg2008 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
esttab using table8.csv, b(%12.3fc) se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop rvrdist) order(lnjinshipop rvrdist) replace


** Table 9 **
eststo clear
set more off
eststo: xi: reg lnofficialqing lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnofficialqing (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnofficialrp lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnofficialrp (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnccm2148 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnccm2148 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnccm4977 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnccm4977 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: reg lnccm7817 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
eststo: xi: ivreg2 lnccm7817 (lnjinshipop=bprvdist) rvrdist lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
esttab using table9.csv, b(%12.3fc) label se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop rvrdist) order(lnjinshipop rvrdist) replace


** Table 10 **
use census05_final.dta, clear
eststo clear
eststo: xi: areg lneduyear c.lnjinshipop c.fedu c.medu c.lnfinc c.lnhousesize lnnightlight lncoastdist tri suitability lnpopdensity urbanrates age male han urban, ab(provid) r cluster(prefid)
eststo: xi: areg lneduyear c.lnjinshipop##c.fedu c.medu c.lnfinc c.lnhousesize lnnightlight lncoastdist tri suitability lnpopdensity urbanrates age male han urban, ab(provid) r cluster(prefid)
eststo: xi: areg lneduyear c.lnjinshipop##c.medu c.fedu c.lnfinc c.lnhousesize lnnightlight lncoastdist tri suitability lnpopdensity urbanrates age male han urban, ab(provid) r cluster(prefid)
eststo: xi: areg lnincome c.lnjinshipop c.fedu c.medu c.lnfinc c.lnhousesize lnnightlight lncoastdist tri suitability lnpopdensity urbanrates age male han urban, ab(provid) r cluster(prefid)
eststo: xi: areg lnincome c.lnjinshipop##c.lnfinc c.fedu c.medu c.lnhousesize lnnightlight lncoastdist tri suitability lnpopdensity urbanrates age male han urban, ab(provid) r cluster(prefid)
eststo: xi: areg lnincome c.lnjinshipop##c.lnhousesize c.fedu c.medu c.lnfinc lnnightlight lncoastdist tri suitability lnpopdensity urbanrates age male han urban, ab(provid) r cluster(prefid)
esttab using table10.csv, b(%12.3fc) se ar2 nogap replace


** Table A1 in Appendix C **
*Moran's I test*
use census10_final.dta, clear

reg lneduyear lnjinshipop i.prov, r cl(provid)
predict re1, residuals
spatwmat, name(w) xcoord(x) ycoord(y) band(0 5)
spatgsa re1, weights(w) moran

reg lneduyear lnjinshipop, r cl(provid)
predict re0, residuals
spatwmat, name(w) xcoord(x) ycoord(y) band(0 5)
spatgsa re0, weights(w) moran


/* Please refer to Readme.pdf file for the detailed precedures to produce and merge the spaital simulation variables */
/* Warning: In case you encounters the error message like this "... x.dta cannot be modified or erased; likely cause is read-only 
directory or file", it may due to  the loop executes and finishes more quickly than the operating system finishes writing out 
the last version of the file (in other word, disk output is very slow compared to computation). If so, just enlarge the # of ms 
in the -sleep- code. Now I set it to 0 ms, you can enlarge it if you still receive the error message as above. But please
be noticed that the time for finishing the whole procedure will significantly longer if you add more sleep time inside. */

cd "D:\Dropbox\jinshi_backup\Final publication file\3 replication package"

use census10_final.dta, clear
quietly reg lneduyear noise3_1 i.prov, r cl(prov)
regsave noise3_1 using results1, tstat pval replace
forvalue y=3/5 {
forvalue x=1/500 {
quietly reg lneduyear noise`y'_`x' i.prov, r cl(prov)
sleep 0
regsave noise`y'_`x' using results1, tstat pval append
sleep 0
}
}
use results1, clear
drop if [_n]==1501
gen panel="A"
gen model=1
save results1, replace

use census10_final.dta, clear
quietly reg noise3_1 lnjinshipop i.prov, r cl(prov)
regsave lnjinshipop using results2, tstat pval replace
forvalue y=3/5 {
forvalue x=1/500 {
quietly reg noise`y'_`x' lnjinshipop i.prov, r cl(prov)
sleep 0
regsave lnjinshipop using results2, tstat pval append
sleep 0
}
}
use results2, clear
drop if [_n]==1501
gen panel="A"
gen model=2
replace var="noise3" if var=="lnjinshipop" & [_n]>1000 & [_n]<=1500
replace var="noise4" if var=="lnjinshipop" & [_n]>500 & [_n]<=1000
replace var="noise5" if var=="lnjinshipop" & [_n]>0 & [_n]<=500
save results2, replace

use census10_final.dta, clear
quietly reg lneduyear noise3_1 lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
regsave noise3_1 using results3, tstat pval replace
forvalue y=3/5 {
forvalue x=1/500 {
quietly reg lneduyear noise`y'_`x' lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
sleep 0
regsave noise`y'_`x' using results3, tstat pval append
sleep 0
}
}
use results3, clear
drop if [_n]==1501
gen panel="B"
gen model=1
save results3, replace

use census10_final.dta, clear
quietly reg noise3_1 lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
regsave lnjinshipop using results4, tstat pval replace

forvalue y=3/5 {
forvalue x=1/500 {
quietly reg noise`y'_`x' lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid, r cl(provid)
sleep 0
regsave lnjinshipop using results4, tstat pval append
sleep 0
}
}

use results4, clear
drop if [_n]==1501
gen panel="B"
gen model=2
replace var="noise3" if var=="lnjinshipop" & [_n]>1000 & [_n]<=1500
replace var="noise4" if var=="lnjinshipop" & [_n]>500 & [_n]<=1000
replace var="noise5" if var=="lnjinshipop" & [_n]>0 & [_n]<=500
save results4, replace

use results1, clear
append using results2, force
append using results3, force
append using results4, force
gen str11 degree=substr(var, 6, 1)
destring degree, replace 

mark outperformce if pval<0.0000001
mark pval_p05 if pval<=0.05 & pval>0.01
mark pval_p01 if pval<=0.01 & pval>0.001
mark pval_p001 if pval<=0.001 & pval>0.0001
mark pval_p0001 if pval<=0.0001 
foreach x in pval_p05 pval_p01 pval_p001 pval_p0001 {
bysort degree model panel: egen m`x'=mean(`x')
}
keep degree model panel outperformce mpval_p05-mpval_p0001
duplicates drop degree model panel, force
sort panel model degree
egen pd=group(panel degree)
reshape wide mpval_p05-mpval_p0001, i(pd) j(model)
drop pd
order panel degree outperformce 
save table_a1, replace

** Table A2 in Appendix D **
use census10_final.dta, clear
mark yangtze if prefid==420100 | prefid==421100 | prefid==420800 | prefid==421000 | prefid==420900 | prefid==421300 ///
              | prefid==430100 | prefid==430200 | prefid==430300 | prefid==430400 | prefid==430500 | prefid==430700 ///
			  | prefid==360100 | prefid==360400 | prefid==360200 | prefid==361000 | prefid==340100 | prefid==340200 ///
			  | prefid==340700 | prefid==340500 | prefid==320100 | prefid==320200 | prefid==320400 | prefid==320500 ///
		      | prefid==321000 | prefid==321100 | prefid==330100 | prefid==330200 | prefid==330400 | prefid==330500 ///
		      | prefid==330600 | prefid==330300 | prefid==331000 | prefid==310000

eststo clear
set more off
eststo: xi: reg lneduyear lnjinshipop i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lneduyear lnjinshipop lnnightlight lncoastdist tri i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lneduyear lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lneduyear lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lnnspop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lnmppop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lnhighpop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid if yangtze==0, r cl(provid)
eststo: xi: reg lnunipop lnjinshipop lnnightlight lncoastdist tri suitability lnpopdensity urbanrates i.provid if yangtze==0, r cl(provid)
esttab using table_a2.csv, b(%12.3fc) label se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(lnjinshipop lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates) order(lnjinshipop lnjinshipopm lnnightlight lncoastdist tri suitability lnpopdensity urbanrates) replace


** Table A3 in Appendix E **
eststo clear
foreach y in ccenter teacenter silkcenter lnpopming lnpopqing lnpop1953 urbanrates lnurban1920 rice_s wheat_s ///
             econ_s maize_s sp_s tri drought flood lnccdist lnsilkdist lnteadist lncitydist lnbjdist lnpcdist {
eststo: xi: areg `y' bprvdist, ab(prov) r cl(prov)
}
esttab using table_a3.csv, b(%12.3fc) label se ar2 nogap star(* 0.10 ** 0.05 *** 0.01) keep(bprvdist) replace


** Table A4 in Appendix F **
/* Tables A4 use the confidential surname and location information in the China Family Panel Studies. 
According to the data access policy of the Institute of Social Science Survey, such data could only be 
accessed on-site in the Institute. */
