# Notes - Tips and tricks

## Git stop tracking of files

To hide files from git. useful when you have config files with apikeys or other sensitive information.

`git update-index --skip-worktree <file path>'

## VIM - commands

### Vim retab commands

```
:set expandtab
:set noexpandtab
:%retab!

```

### Replace 

Equalent to the syntax used in sed. Use `:%s/<find>/<replace>/g`
