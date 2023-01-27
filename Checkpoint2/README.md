# Checkpoint2 Submission
```
- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**
```

## Table of Contents
1. [PART A - Adding Files - Local Repo Work Flow](#PART-A---Adding-Files---Local-Repo-Work-Flow)
2. [Part B - Inspecting Local Repo with git status and git log](#Part-B---Inspecting-Local-Repo-with-git-status-and-git-log)
3. [Part C - Creating & Merging Branches](#Part-C---Creating-&-Merging-Branches)
4. [Part D - Git Branching Strategy Review Questions](#Part-D---Git-Branching-Strategy-Review-Questions)

##  PART A - Adding Files - Local Repo Work Flow

**GIT LOG**
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
**FILES ADDED LOCALLY**
```
--UNTRACKED--
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	git_status_untracked.txt

```
```
--UNCOMMITED--
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	git_status_uncommitted.txt
	git_status_untracked.txt
```
```
--COMMITTED--
On branch main
Your branch is ahead of 'origin/main' by 2 commits.
  (use "git push" to publish your local commits)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	git_status_committed.txt
	git_status_uncommitted.txt
	git_status_untracked.txt

nothing added to commit but untracked files present (use "git add" to track)
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
![Branching Conventions](https://github.com/144525201-myseneca/CSN400-Capstone/blob/8bf86a736d6b00f8d603a6b3fbecc45b9fd6e72d/Checkpoint2/screenshots/branching-conventions.png)

**What are the differences between develop branch and main branch?**

GitHub is like a vast digital library where developers can store, manage, and collaborate on their projects. It's built on top of Git, which acts like a librarian, keeping track of all the changes made to the code.

When working as a team, understanding the naming conventions and branching strategy can make a significant impact on the project's efficiency. It's like keeping a closet organized; if everything is labeled and in its proper place, it's much easier to find what you need and ensure it reaches the right destination.

In Git, we have the develop and main branches. The main branch is like the final destination, it's where all the polished code goes before it gets released to the public. Meanwhile, the develop branch acts like a testing ground, where new features are experimented with and evaluated before they make their way to the main branch.

A clear and consistent branching strategy is vital to understand where different features and fixes are in the development process, and it also aids in preventing confusion and merge conflicts.

**What are the three supporting branches? Briefly describe the function of each of these supporting branches.**

GitHub uses three supporting branches (feature, release, and hotfix) to help keep code organized and easy to understand. By separating the development process into different branches, it allows for efficient and streamlined workflow.

Feature branches are like a separate project within a company. Imagine you're working on a new product, you don't want to mix it with the current projects, right? That's the same idea with feature branches. It's a place where new features are developed and tested, away from the main codebase. This way, you can try out new things and make sure they fit before adding them to the final product.

Release branches are like the final presentation in a company. Once the product has been developed and tested, they need to be presented to the public. That's where release branches come in. It's where we take the code that's been tested and approved on feature branches, and make sure it's ready to be shipped out to the public. We'll do final testing, check for any last-minute bugs, and make sure everything is polished and presentable.

Hotfix branches are like the emergency section in a company. Sometimes, you might need to make a quick fix before the next release, maybe a bug in the code or a problem with the design. That's where hotfix branches come in. These branches are used to quickly fix critical issues that need to be addressed before the next release. This way, we can make sure we're always putting our best foot forward.

All of these branches work together to help us keep our code organized and easy to understand, making the development process run smoothly and efficiently.

**What are the best practices in working with release branches?**

When working with release branches, it's essential to establish a streamlined process to ensure a smooth and successful release. Here are some best practices to keep in mind:

   - Create a new release branch: Before beginning a new release, create a new branch off of the development branch. This ensures that the release branch is up-to-date with the latest code, features, and changes.

   - Maintain organization: Utilize a consistent naming convention for release branches, such as "release/x.x.x" where x.x.x represents the version number. This allows for easy identification and tracking of releases.

   - Quality assurance: Conduct thorough code reviews and testing before merging code into the release branch. This guarantees that the code is of the highest quality and free of bugs before release.

   - Test thoroughly: Perform comprehensive testing, including functional, performance, and regression testing, before releasing.

   - Communicate effectively: Maintain open communication with team members regarding the progress of the release. This ensures that everyone is informed and on the same page.

   - Tag the release: Once the release is ready, create a tag with the version number. This allows for easy reference and tracking of the release in the future.

   - Close the loop: Once the release is complete and tested, merge the release branch back to the main branch. This ensures that the main branch always contains the latest, stable version of the code.

By following these best practices, you can streamline the release process, maintain high-quality code, and keep your team informed and organized. With a solid plan in place, releasing can be a breeze.

