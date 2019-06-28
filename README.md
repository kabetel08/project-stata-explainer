# A Guide on the Stata `Project` Command from Picard

June 2019

Konrad Franco (klfranco@ucdavis.edu)

The included example project file contains a reproductible working example for Stata users through Version 15.1.
In order to experiment with my example, please download the folder called **project-example.**

Then set-up the project by typing: `project, setmaster("[filepath]\project-example\example.do") textlog`
This command tells Stata to use the do filed titled **example.do.** as the primary "master do-file." All the other do-files are nested within the do-file called **example.do.**

Then you can build the project by typing: `project example, build.` 

You can obtain a useful concordance table for your project by typing: `project example, concordance.` 
This prompt generates a nice tables that lists the dependencies for each do-file.

You can even create an archive of your project by typing: `project example, archive.`
As you project evolves you can run this archive command sometimes and it will archive all the components of your project that haven't changed since the last time you moved things to the archive. 

You can replicate your entire project by typing `project example, replicate.` 
This prompt will rebuild the entire project and check for differences among all the files that were created from the nested do-files in the master script. 

You can easily clear all the files that the project created by running the prompt: `project example, rmcreated.` This will erase all files in the main directory that were created by the project. 

Sometimes it is useful to share your work. You can do this easily by typing: `project example, share(alltime)` This prompt will share all files, irrespective of when they were added/modified. However you may only wish to share the original (i.e., raw data) and/or code for your project. In that case you can tell Stata to not share any of the files created by the project by typing: `project example, share(nocreated).`


The Wiki for this page contains a review of: 
  1. the motivation for using the command
  2. what the command can and cannot do 
  3. how to install and set-up the comamnd
  4. the project management tasks 
  5. the build directives
  
