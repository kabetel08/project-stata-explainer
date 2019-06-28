# A Guide on the Stata `Project` Command from Picard

June 2019

Konrad Franco (klfranco@ucdavis.edu)

The included example project file contains a reproductible working example for Stata users through Version 15.1.
In order to experiment with my example, please download the folder called **project-example.**

Then set-up the project by typing: `project, setmaster("[filepath]\project-example\example.do") textlog`
This command tells Stata to use the do filed titled **example.do.** as the primary "master do-file." All the other do-files are nested within the do-file called **example.do.**

With project, you never run a do-file in isolation, you always rebuild the whole project. This may appear inefficient, especially as a project increases in size and complexity but *project is smart and can track changes in do-files.* If a do-file has not changed since the last build and none of the files it uses or creates have changed either, project will not run the do-file for the current build. Thus you can have a mature project with hundreds (or thousands) of do-files, each using and creating even more files (of any kind) and project will only re-run do-files that have changed since the last build AND do-files that must be run again because the files they use have changed as part of the ongoing build.
Then you can build the project by typing: `project example, build.` 

You can obtain a useful concordance table for your project by typing: `project example, concordance.` 
This prompt generates a nice tables that lists the dependencies for each do-file.

You can even create an archive of your project by typing: `project example, archive.`
As you project evolves you can run this archive command sometimes and it will archive all the components of your project that haven't changed since the last time you moved things to the archive. 

You can replicate your entire project by typing `project example, replicate.` 
This prompt will rebuild the entire project and check for differences among all the files that were created from the nested do-files in the master script. 

You can easily clear all the files that the project created by running the prompt: `project example, rmcreated.` This will erase all files in the main directory that were created by the project. 

When work is finished on a project, you have a self contained project with all code, data, figures, and tables within a master directory (and a bunch of subdirectories, each of which can contain subdirectories, and so on) that can be zipped and submitted in support of a manuscript to a journal. Anyone can download the archive and the code will run on any platform (Mac, PC, etc) without having to make a single change to adjust for file paths.

Sometimes it is useful to share your work. You can do this easily by typing: `project example, share(alltime)` This prompt will share all files, irrespective of when they were added/modified. However you may only wish to share the original (i.e., raw data) and/or code for your project. In that case you can tell Stata to not share any of the files created by the project by typing: `project example, share(nocreated).` Both these share command create a sub-folder in the archive folder. The sub-folder is stamped with the data and a file ID. You can share that folder with anybody and they can effortlessly build or replicate the entire project locally on their machine. If you have multiple people you wish to repeatedly share the folder with you can specify a name by typing: `project example, share(name).` copies to an archive directory all files that have been added or have changed since the last time files were shared with "name". 

The Wiki for this page contains a review of: 
  1. the motivation for using the command
  2. what the command can and cannot do 
  3. how to install and set-up the comamnd
  4. the project management tasks 
  5. the build directives
  
