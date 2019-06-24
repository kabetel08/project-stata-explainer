
clear
project, doinfo
if _rc==0 {
	local pdir "`r(pdir)'"						// name the local macro for the project root directory
	local dofile "`r(dofile)'"					// do file's stub name
	local sig {bind: {hi: [`dofile'.dta. RP: `dofile'.do, `c(current_date']}}	// add a signature in the notes
	local doasproject=1
}

else {
	local pdir "~/example_project"
	local dofile "table1"
	local doasproject=0
}

set more off
local 

export excel x y z using `tables'/`dofile'.xlsx, firstrow(varlabels) replace

if `doasproject'==1 {
	project, creates("`tables'/`dofile'.xlsx")
}


