# GIT Tips
 
## Sync your fork
Sync your fork to keep it up-to-date with the original (upstream) repo.
 
(1)     Fetch all changes from upstream.
 
`$ git fetch upstream`
 
(2)     Switch to your fork’s local master branch.
 
`$ git checkout master`
 
(3)     Merge the changes from upstream/master into your local master branch.
 
`$ git merge upstream/master`
 
 
(self-learning: git rebase)
 
### Push your changes
This is about the steps of commit and push changes to your fork on GitHub when you have changed something in your local repo.
 
(1)     Stage the file for commit. “.” is to stage all changes you have made.
`$ git add .`
Check git status:
```
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
 
        new file:   test.txt
        new file:   test2.txt
```
 
(2)     Commit the file(s) that you have staged in your local repo.
```
$ git commit -m "test: for git test"
[master c7dae40] test: for git test
2 files changed, 0 insertions(+), 0 deletions(-)
create mode 100644 test.txt
create mode 100644 test2.txt
Check git status:
$ git status
On branch master
nothing to commit, working tree clean
```
Best practice: follow the below defined type to compile your commit messages followed ‘-m’.
```
-feat: <what new feature>
-fix: <what bug has been fixed>
-docs: <doc changes>
-style: <typo or format change>
-perf: <performance enhancement>
-refactor: <refactor of  code>
-test: <testing code added>
-chore: <others>
```
 
(3)     Push the changes from your local repo to your fork on GitHub. Use command “git push origin your-branch”.
```
$ git push origin master
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 350 bytes | 10.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com/.git
   0b0048c..c7dae40  master -> master
```
Then on your fork repo, you can see the submitted changes.
 
### Create a "pull request"
You need to create a “pull request” when you want to contribute to the original (upstream) repo.
From your fork, click button **New pull request**.
 
And then click **Create pull request** if it’s “Able to merge”. If there is a conflict, please pull the request after you solve the conflict.
 
### Review and Merge
On the original repo, when a pull request comes in, the Reviewer(s) will review the changes and approve it. Then the Merger(s) will check if the new code is structured right and sits at the right place and merge it.
 
#### Tip: Checkout Pullrequest for testing
You could follow below steps to fetch the codes in this pull request.
 
1. Clone this  Repo. 
2. Find the ID number of this pull request. This is a sequence of digits right after the pull request's title.  
For example, in the pullrequest title `feat: added security checks features and email notification report #10`, 10 is its PR ID. 
3. Create a new branch using the PR ID. 
$ git fetch origin pull/ID/head:BRANCHNAME 
For example, in this case, the command line should be (pr_10 is the branch created): 
`/$ git fetch origin pull/10/head:pr_10` 
4. Switch to the new branch.  
`/$ git checkout pr_10` 
  
At this point, you can run tests with this branch.
 