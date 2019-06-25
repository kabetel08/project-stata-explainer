# A Guide on the Stata `Project` Command from R. Picard

June 2019

Konrad Franco (klfranco@ucdavis.edu)

`do(filename)` run a nested do-file
original(filename): indicate an input file dependency for a currently running do-file, the input file is not created within the project

`uses(filename)` indicate an input file dependency for a currently running do-file, the input file was previously created within the project

`relies_on(filename)` indicate a dependency the currnelty running do-file relies on information in the file with filename (the file itself is not directly accessed though, eg. pdf or docx)

`creates(filename)` indicate an output file dependency for the currently running do-file filename was previously saved to disk by the current do-file

`doinfo` retrieve project info within a do-file

`break` stop execution of the build from within a do-file, the data in memory is preserved

`build` build the project by running the master do-file

`list(options)` list files in the project, use the `index` option to list projects alphabetically, use the `directory` option to list files by directory, use the `concordance` option to produce a dependency do-file concordance table, use the `archive` option to list project files that would be copied to the archive directory by the archive task, use the `cleanup` option to list the files that would be moved to the archive directory because they are in the project folder but not included in the project

`validate` validate a build by checking that the project files have not changed since the last build 

`replicate` completely rebuild the project and check that all created files for differences 

`archive` copy files that have changed since the last archive to the archive directory

`cleanup` move files that are in the project directory but are not referenced within the build

`rmcreated` erase all files created by the project
