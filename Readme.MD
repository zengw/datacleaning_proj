git add readme.md
git commit -m "it's a readme file"
git push https://github.com/zengw/foldername
git pull https://github.com/zengw/foldername
cd pathtothefolder
git status
git stash

Fork the repository that is linked on the assigment page. This is done on the github website. 
Once you successfully forked the repository, you will have a version of that repo under your personal github area
If you look on the right-hand side, you will see a git clone url. You should copy this url. 
Open up a terminal if you are on a Mac or Linux machine (on Windows you need Git Bash I think, maybe someone can confirm this)
Navigate to a directory where you want to put the repository, e.g. /home/myname/Coursera/
Now you can clone the repo using the url we copied from the github page: 
git clone git_clone_url
This will make a directory called ExData_Plotting1
Copy your png files and .R scripts to the directory ExData_Plotting1
Navigate to the directory, and follow the steps I put in my original post above. 

Open up a terminal and navigate to the directory where you cloned your forked version of the repo. 
Then type
git add plot1.png plot2.png
etc to tell git to add them to the repo. 
Then you need to commit with 
git commit -m "put some message here"
And finally you need to push your changes up to the github server
git push
If all this work

