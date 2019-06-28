/***************************************************************************************************
Program: Example Master Do-File for User Written Project Command
Author: Konrad Franco (klfranco@ucdavis.edu)
Date: June 2019
***************************************************************************************************/
clear all
set more off
set varabbrev off								// For long projects, it's best not to abbreviate
set linesize 132								// Use 7pt font for printing

project, doinfo
	local pdir "`r(pdir)'"						// Name the local macro for the project root directory
	local dofile "`r(dofile)'"					// Do file's stub name
	local sig {bind: {hi: [RP: `dofile'.do]}}	// Add a signature in the notes

	local data "`pdir/data"						// Name the local macro for the rawdata sub directory
	local code "`pdir'/code"					// Name the local macro for the code sub directory

timer on 1

project, do("code/clean.do")						// Clean and prep data

project, do("code/regression.do")			// Run regression analysis

project, do("code/figures.do")				// Produce figure 1

project, do("code/tables.do")				// Produce table 1

timer off 1
timer list 1
