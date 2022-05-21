
*  (please change All paths manually to exactly where the downloaded files are stored)

clear all
cd "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\similuation_variables_for_table_a1\simu_tif5"
set more off
foreach num of numlist 1(1)500 {
import excel "psimu_`num'.xls", sheet("psimu_`num'") firstrow clear
rename grid_code noise`num'
drop FID
save noise`num'.dta, replace
}

clear 
use noise1.dta, clear
foreach num of numlist 2(1)500 {
merge 1:1 pointid using noise`num'.dta
drop _merge
}

merge 1:m pointid using "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\similuation_variables_for_table_a1\citycode_pointid.dta"

keep if _merge==3

rename code_2009 citygb

drop _merge

replace citygb=110000 if citygb==110100|citygb==110200
replace citygb=120000 if citygb==120100|citygb==120200
replace citygb=310000 if citygb==310100|citygb==310200
replace citygb=500000 if citygb==500100|citygb==500200

drop if citygb==0

bysort citygb: gen doppio=_N
codebook doppio
foreach num of numlist 1(1)500 {
egen tempt`num'=sum(noise`num'), by(citygb)
}

order pointid citygb
sort citygb

foreach num of numlist 1(1)500 {
replace noise`num'=tempt`num'/doppio if doppio==2
}

drop tempt* doppio
drop pointid
duplicates drop
rename citygb prefid
save "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\noise5.dta", replace

*  (please change the path to exactly where the downloaded files are stored)
cd "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\similuation_variables_for_table_a1\simu_tif4"
set more off
foreach num of numlist 1(1)500 {
import excel "psimu_`num'.xls", sheet("psimu_`num'") firstrow clear
rename grid_code noise`num'
drop FID
save noise`num'.dta, replace
}

clear 
use noise1.dta, clear
foreach num of numlist 2(1)500 {
merge 1:1 pointid using noise`num'.dta
drop _merge
}

merge 1:m pointid using "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\similuation_variables_for_table_a1\citycode_pointid.dta"

keep if _merge==3

rename code_2009 citygb

drop _merge

replace citygb=110000 if citygb==110100|citygb==110200
replace citygb=120000 if citygb==120100|citygb==120200
replace citygb=310000 if citygb==310100|citygb==310200
replace citygb=500000 if citygb==500100|citygb==500200

drop if citygb==0

bysort citygb: gen doppio=_N
codebook doppio
foreach num of numlist 1(1)500 {
egen tempt`num'=sum(noise`num'), by(citygb)
}

order pointid citygb
sort citygb

foreach num of numlist 1(1)500 {
replace noise`num'=tempt`num'/doppio if doppio==2
}

drop tempt* doppio
drop pointid
duplicates drop
rename citygb prefid
save "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\noise4.dta", replace

*  (please change the path to exactly where the downloaded files are stored)
cd "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\similuation_variables_for_table_a1\simu_tif3"
set more off
foreach num of numlist 1(1)500 {
import excel "psimu_`num'.xls", sheet("psimu_`num'") firstrow clear
rename grid_code noise`num'
drop FID
save noise`num'.dta, replace
}

clear 
use noise1.dta, clear
foreach num of numlist 2(1)500 {
merge 1:1 pointid using noise`num'.dta
drop _merge
}

merge 1:m pointid using "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\similuation_variables_for_table_a1\citycode_pointid.dta"

keep if _merge==3

rename code_2009 citygb

drop _merge

replace citygb=110000 if citygb==110100|citygb==110200
replace citygb=120000 if citygb==120100|citygb==120200
replace citygb=310000 if citygb==310100|citygb==310200
replace citygb=500000 if citygb==500100|citygb==500200

drop if citygb==0

bysort citygb: gen doppio=_N
codebook doppio
foreach num of numlist 1(1)500 {
egen tempt`num'=sum(noise`num'), by(citygb)
}

order pointid citygb
sort citygb

foreach num of numlist 1(1)500 {
replace noise`num'=tempt`num'/doppio if doppio==2
}

drop tempt* doppio
drop pointid
duplicates drop
rename citygb prefid
save "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\noise3.dta", replace




cd "D:\Dropbox\jinshi_backup\Final publication file\3 replication package\"
use census10_final.dta, clear

forvalue x=3/5 {
merge m:1 prefid using noise`x'.dta
drop if _merge==2
drop _merge
}

save census10_final.dta, replace

