# A Guide on the Stata `Project` Command from Picard

June 2019

Konrad Franco (klfranco@ucdavis.edu)

The included example project file contains a reproductible working example for Stata users through Version 15.1.
In order to experiment with my example, please download the folder called **project-example.**


The Wiki for this page contains a review of: 
  1. the motivation for using the command
  2. what the command can and cannot do 
  3. how to install and set-up the comamnd
  4. the project management tasks 
  5. the build directives
  
Then set-up the project by typing: `project, setmaster("[filepath]\project-example\example.do") textlog`
This command tells Stata to use the do filed titled **example.do.** as the primary "master do-file." All the other do-files are nested within the do-file called **example.do.**

With project, you never run a do-file in isolation, you always rebuild the whole project. This may appear inefficient, especially as a project increases in size and complexity but *project is smart and can track changes in do-files.* If a do-file has not changed since the last build and none of the files it uses or creates have changed either, project will not run the do-file for the current build. Thus you can have a mature project with hundreds (or thousands) of do-files, each using and creating even more files (of any kind) and project will only re-run do-files that have changed since the last build AND do-files that must be run again because the files they use have changed as part of the ongoing build.
Then you can build the project by typing: `project example, build.` 

You can obtain a useful concordance table for your project by typing: `project example, concordance.` 
This prompt generates a nice tables that lists the dependencies for each do-file.

You can even create an archive of your project by typing: `project example, archive.`
As you project evolves you can run this archive command sometimes and it will archive all the components of your project that haven't changed since the last time you moved things to the archive. When work is finished on a project, you have a self contained project with all code, data, figures, and tables within a master directory (and a bunch of subdirectories, each of which can contain subdirectories, and so on) that can be zipped and submitted in support of a manuscript to a journal. Anyone can download the archive and the code will run on any platform (Mac, PC, etc) without having to make a single change to adjust for file paths.

You can replicate your entire project by typing `project example, replicate.` 
This prompt will rebuild the entire project and check for differences among all the files that were created from the nested do-files in the master script. 

You can easily clear all the files that the project created by running the prompt: `project example, rmcreated.` This will erase all files in the main directory that were created by the project. 

Sometimes it is useful to share your work. You can do this easily by typing: `project example, share(alltime)` This prompt will share all files, irrespective of when they were added/modified. However you may only wish to share the original (i.e., raw data) and/or code for your project. In that case you can tell Stata to not share any of the files created by the project by typing: `project example, share(nocreated).` Both these share command create a sub-folder in the archive folder. The sub-folder is stamped with the data and a file ID. You can share that folder with anybody and they can effortlessly build or replicate the entire project locally on their machine. If you have multiple people you wish to repeatedly share the folder with you can specify a name by typing: `project example, share(name).` copies to an archive directory all files that have been added or have changed since the last time files were shared with "name". 

I have added a bit of extra functionality to the `project` command by adding a local titled `doasproject` in the example files included. Normally you have to run `project example, build` everytime you wish to test whether or not your do-file works. This is ok because `project` is smart and only runs the do-files that haven't changed. However, the only way to invoke `project` is from the Stata command line, which can be bothersome if you are doing experimental edits with your do-file. Sometimes I wish to test my do-file by running the whole script from my do-file editor directly. The added local `doasproject` allows me to accomplish this goal. For example if I am working on the do-file "regression.do" and I want to test the output I don't have make a change and then re-run building the project from the command line. I can simply highlight all the code in the "regression.do" script or use my keyboard hot-key to "run all." The example scripts I have included are different from the example files provided by Picard because the first line of my do-files checks to see if there is a project being built. If there's not one actively being built it allows the script to continuing running and sets the local `doasproject` equal to 1. 
