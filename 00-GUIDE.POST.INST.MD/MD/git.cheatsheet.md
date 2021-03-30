### GIT 

- https://github.community/t5/How-to-use-Git-and-GitHub/How-to-delete-multiples-files-in-Github/m-p/4709#M1543

- https://stackoverflow.com/a/35975917

It is a submodule. to remove it do the following:
Delete relevant line from the .gitmodules file
Delete relevant section from .git/config
Run `git rm --cached path_to_submodule` (no trailing slash)
Commit and delete the now untracked submodule files.

- https://stackoverflow.com/a/26000395

Deleting the .git folder may cause problems in your git repository. 
If you want to delete all your commit history but keep the code in its current state, it is very safe to do it as in the following:

Checkout
```
git checkout --orphan latest_branch
```
Add all the files
```
git add -A
```
Commit the changes
```
git commit -am "commit message"
```
Delete the branch
```
git branch -D master
```
Rename the current branch to master
```
git branch -m master
```
Finally, force update your repository
```
git push -f origin master
```
PS: this will not keep your old commit history around
