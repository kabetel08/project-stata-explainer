clear all 
set more off
set varabbrev off								// For long projects, it's best not to abbreviate
set linesize 132								// Use 7pt font for printing

project, doinfo
	local pdir "`r(pdir)'"						// Name the local macro for the project root directory
	local dofile "`r(dofile)'"					// Do file's stub name
	local sig {bind: {hi: [RP: `dofile'.do]}}	// Add a signature in the notes

	local rawdata "`pdir/rawdata"				// Name the local macro for the rawdata sub directory
	local code "`pdir'/code"					// Name the local macro for the code sub directory
	local analysis "`code'/analysis"			// Name the local macro for the analysis sub directory
	local figures "`code'/figures"				// Name the local macro for the figures sub directory
	local tables "`code'/tables"				// Name the local macro for the tables sub directory

timer on 1

project, do("code/clean")						// Clean and prep data

project, do("analysis/regression.do")			// Run regression analysis

project, do("analysis/figures.do")				// Produce figure 1

project, do("analysis/tables.do")				// Produce table 1

timer off 1
timer list 1
