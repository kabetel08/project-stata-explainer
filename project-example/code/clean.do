/***************************************************************************************************
Program: Example Do File for Wrangling, Cleaning and Managing Data with the User Written Project Command
Author: Konrad Franco (klfranco@ucdavis.edu)
Date: June 2019
***************************************************************************************************/
clear
capture project, doinfo
if _rc == 0 {
	local pdir "`r(pdir)'"						// name the local macro for the project root directory
	local dofile "`r(dofile)'"					// do file's stub name
	local sig {bind: {hi: [`dofile'.dta. RP: `dofile'.do, `c(current_date']}}	// add a signature in the notes
	local doasproject = 1
}

// if there is no project being built I still want to run the do file though so I can set alternative locals to acccomplish that
else {
	local pdir "C:\Users\konra\Documents\GitHub\project-stata-explainer\project-example"
	local dofile "clean"
	local doasproject = 0
}

set more off
di "`pdir'"
local data "`pdir'/data"
local output "`pdir'/output"

if `doasproject' == 1 {
	project, original("`data'/auto.dta")
}

use "`data'/auto.dta"
quietly summarize mpg, detail
local median_mpg = r(p50)

gen efficient = 0
replace efficient = 1 if mpg > `median_mpg'
label variable efficient "Above median fuel economy"
label define efficient_labs 1 "Efficient" 0 "Inefficient"
label values efficient efficient_labs

replace mpg = mpg / 2.352
label variable mpg "Mileage (km per liter)"

replace headroom = headroom * 2.54 
label variable headroom "Headroom (cm)"

replace trunk = trunk / 28.317 
label variabl trunk  "Trunk space (liter)"

replace weight = weight /  2.205 
label variable weight "Weight (kg)"

replace length = length * 2.54 
label variable length "Length (cm)"

replace turn = turn / 3.281
label variable turn "Turn Circle (meter)"

replace displacement = displacement / 61.024 
label variable displacement "Displacement (liter)"

save "`data'/auto_edited.dta", replace

if `doasproject' == 1  {
	project, creates("`data'/auto_edited.dta")
}
