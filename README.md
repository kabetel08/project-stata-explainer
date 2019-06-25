# `Project` by Richard Picard
## A Stata Guide on the Useful User Written Command

June 2019

Konrad Franco (klfranco@ucdavis.edu)

`do(filename)` run a nested do-file
original(filename): indicate an input file dependency for a currently running do-file, the input file is not created within the project

`uses(filename)` indicate an input file dependency for a currently running do-file, the input file was previously created within the project

`relies_on(filename)` indicate a dependency the currnelty running do-file relies on information in the file with filename (the file itself is not directly accessed though, eg. pdf or docx)

`creates(filename)` indicate an output file dependency for the currently running do-file filename was previously saved to disk by the current do-file

`doinfo` retrieve project info within a do-file

`break` stop execution of the build from within a do-file, the data in memory is preserved
