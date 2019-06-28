# A Guide on the Stata `Project` Command from Picard

June 2019

Konrad Franco (klfranco@ucdavis.edu)

The included example project file contains a reproductible working example for Stata users through Version 15.1.
In order to experiment with my example, do download the folder called *project-example.*

Then set-up the project by typing: `project, setmaster("[filepath]\project-example\example.do") textlog`
This command tells Stata to use the do filed titled *example.do* as the primary "master do-file." All the other do-files are nested within the do-file called *example.do.*

The Wiki for this page contains a review of: 
  1. the motivation for using the command
  2. what the command can and cannot do 
  3. how to install and set-up the comamnd
  4. the project management tasks 
  5. the build directives
  
  
