/***************************************************************************************************
Program: Example Do File for Creating a Table with the User Written Project Command
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
	local pdir "~/example_project"
	local dofile "tables"
	local doasproject = 0
}

set more off
local data "`pdir'/data"
local output "`pdir'/output"

if `doasproject' == 1 {
	project, uses("`data'/auto_edited.dta")
}

use "`data'/auto_edited.dta"

tabout rep78 foreign using `output'/tab1.docx, replace style(docx) font(italic) ///
c(mean weight) f(0c) sum  h1(Car type (mean weight in lbs.)) ///
title(Table 1: Simple twoway summary table of means) fn(auto.dta)

tabout rep78 efficient using `output'/tab2.docx, replace style(docx) font(bold) ///
sum npos(tufte) c(mean mpg mean weight mean length median price median headroom) ///
f(1c 1c 1c 2cm 1c) h2(Mean Median) h2c(3 2) clab(MPG Weight_(lbs) Length_(in) Price Headroom_(in)) ///
title(Table 2: Oneway summary table illustrating multiple summary measures) ///
fn(Source: auto.dta) open ptotal(none)

if `doasproject' == 1 {
	project, creates("`output'/tab1.docx")
	project, creates("`output'/tab2.docx")
}
