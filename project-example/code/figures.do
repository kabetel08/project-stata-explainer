/***************************************************************************************************
Program: Example Do File for Creating Figures with the User Written Project Command
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
// you must specify the full path of the projects root dir
else {
	local pdir "C:\Users\konra\Documents\GitHub\project-stata-explainer\project-example"
	local dofile "figures"
	local doasproject = 0
}

set more off
local data "`pdir'/data"
local output "`pdir'/output"

// tell the project command that this do-file uses the auto_edited.dta which the project command already knows was created by the clean.do script
if `doasproject' == 1 {
	project, uses("`data'/auto_edited.dta")
}

// load in the edited metric system auto.dta
use "`data'/auto_edited.dta", clear

// create a histogram and save it as as a png file in the output subdir
histogram mpg, by(foreign)
graph export "`output'/fig1.png", replace

// create another histogram and save it as as a png file in the output subdir
histogram price, by(efficient)
graph export "`output'/fig2.png", replace

// tell the project command using a build directive that this do-file creates both fig1 and fig2
if `doasproject' == 1 {
	project, creates("`output'/fig1.png")
	project, creates("`output'/fig2.png")
}
