# Checkpoint2 Submission
```
- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**
```

## Table of Contents
1. [PART A - Adding Files - Local Repo Work Flow](#header1)
2. [Part B - Inspecting Local Repo with git status and git log](#header2)
3. [Part C - Creating & Merging Branches](#header3)
4. [Part D - Git Branching Strategy Review Questions](#header4)

##  PART A - Adding Files - Local Repo Work Flow

**Git Log**
```
commit dc73511c4c5b60122825e1b6ab809a3f3d4df85c (HEAD -> main, origin/main, origin/HEAD)
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 22:39:55 2023 -0500

    adds text files for CP2 submission

commit 8e557ecc6429da3b504341a007465c67bbbc4cca
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 22:36:40 2023 -0500

    adds Checkpoint2/README.md

commit 45d5c5a457f712490f70ccf6653f5df913a67780
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 22:21:57 2023 -0500

    adds CP2/README.md

commit e6155c9eb7be353ed0fb1ce859d418c2ec0b3d81
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 22:04:14 2023 -0500

    delete wrong CP2

commit 1ec84a00658f5b24167b1fad38d64a4c2b73d76f
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 21:59:42 2023 -0500

    adds CP/README.md
```

## Part B - Inspecting Local Repo with git status and git log

**You can use git status command to understand the status of the files in your 
working directory, staging area and local repo. You can use git log command to get list of your commit history. How do these two commands differ?**

`git status` shows the status of the files in the working directory, the staging area, 
and the local repository. It shows which files have been modified, which files have been 
added to the staging area, and which files are in the local repository but have not been committed.

***see sample image below:***

<div style="text-align:center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/4c7dbc3e0f0e70bad3d1b80f13d96c55e9839a77/Checkpoint2/screenshots/git%20status.PNG" alt="Git Status">
</div>

***another example***
```
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

`git log` shows the commit history for a repository. It lists the commits in reverse 
chronological order, showing the commit hash, author, date, and commit message for each commit. 
The git log command is used to view the commit history for a repository, whereas git status is used
to view the current status of the files in the working directory, staging area, and local repository.

***see sample image below:***
<div style="text-align:center">
  <img src="https://github.com/144525201-myseneca/CSN400-Capstone/blob/2e09fd28ebfc6cd63a83a959e5ae35980914e8ad/Checkpoint2/screenshots/git%20log.PNG" alt="Git Log">
</div>

***another example***
```
$ git log
commit 4c7dbc3e0f0e70bad3d1b80f13d96c55e9839a77 (HEAD -> master, origin/master)
Author: Janelle Almonte <jmalmonte@myseneca.ca>
Date:   Mon Jan 27 18:34:57 2020 +0800

Fixing the bug in the function

commit 2e09fd28ebfc6cd63a83a959e5ae35980914e8ad
Author: Janelle Almonte <janelle-marie.almonte@senecacollege.ca>
Date:   Mon Jan 27 18:10:57 2020 +0800

Adding a new feature
```


In summary, `git status` shows the current state of the repository, while `git log` shows the history of commits made to the repository. They are both useful commands for understanding and managing the state of your Git repository, but serve different purposes.

## Part C - Creating & Merging Branches

**Log Output - Merge**

```bash
$ git log -n 5
commit 9d082298fcc7af089527273beafd8ad27bd53146 (HEAD -> main, origin/main, origin/feat-emojis, origin/HEAD, feat-emojis)
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Fri Jan 27 00:10:41 2023 -0500

    adds emojis to feat-emojis branch

commit 6772c166dda376eddcb7cea58295cb08f2f11e9b
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Fri Jan 27 00:00:02 2023 -0500

    adds footnotes folder

commit 62fcdec8b4a474ea07b9ac91b5900ab6a7008e11
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 23:47:17 2023 -0500

    adds details on README.md

commit 34d74d6b1966e24121799ce621e8133c814dc09e
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 23:43:31 2023 -0500

    adds details on README.md

commit fb38fe35791e5459b4fd8768cd4c734829f2c1ea
Author: jmalmonte <jmalmonte@myseneca.ca>
Date:   Thu Jan 26 23:41:21 2023 -0500

    adds details on README.md

```

This code uses the ` ```bash ` syntax to indicate that the text that follows should be displayed in a monospace font and interpreted as a bash script. The `git log -n 5` command will display the last 5 commits in the repository.

Please note that the output is an example, it may not match the specific output on my repo.

## Part D - Git Branching Strategy Review Questions


