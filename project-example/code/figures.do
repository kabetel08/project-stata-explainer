/***************************************************************************************************
Program: Example Do File for Creating a Figure with the User Written Project Command
Author: Konrad Franco (klfranco@ucdavis.edu)
Date: June 2019
***************************************************************************************************/
clear
capture project, doinfo
if _rc==0 {
	local pdir "`r(pdir)'"						// name the local macro for the project root directory
	local dofile "`r(dofile)'"					// do file's stub name
	local sig {bind: {hi: [`dofile'.dta. RP: `dofile'.do, `c(current_date']}}	// add a signature in the notes
	local doasproject=1
}

// if there is no project being built I still want to run the do file though so I can set alternative locals to acccomplish that
else {
	local pdir "~/example_project"
	local dofile "figures"
	local doasproject=0
}

set more off
local rootdir "`pdir'"
local data "'pdir'/data"
local output "'pdir'/output"

if doasproject==1 {
	project, original("`data'/auto.dta")
	project, uses("`data'/auto_clean.dta")
}

use "`data'/auto.dta"
histogram rep78, by(foreign)
graph export "`output'/fig1.png", replace

use "`data'/auto_clean.dta"
histogram rep78_new, by(foreign_new)
graph export "`output'/fig2.png", replace

if `doasproject'==1 {
	project, creates("`output'/fig1.png")
	project, creates("`output'/fig2.png")
}

