/***************************************************************************************************
Program: Example Do File for Running a Regression and Printing Results in a Table
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
	local dofile "regression"
	local doasproject=0
}

set more off
local rootdir "`pdir'"
local data "'pdir'/data"
local output "'pdir'/output"

if doasproject==1 {
	project, original("`data'/auto.dta")
	project, uses("`data'/auto_edited.dta")
}




if `doasproject'==1 {
	project, creates("`output'/")
}
