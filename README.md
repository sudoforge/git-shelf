# git-shelf

Periodically, you may need to temporarily store changes -- say you're going
out to lunch, or the workday has ended, but you don't want to make a commit
on your branch.

A typical solution in the above case may be to run `git stash`, or even make
a "temporary" commit on the branch. Issues arise with either of these: that
"temporary" commit is pulled down by a coworker, or you forget about it and
it ends up staying in the repository. Stashing is generally okay, but what
would happen if the machine you ran `git stash` on went down?

There's a better way: make a `shelf` branch! This is a branch that exists on
the remote, but only temporarily - it contains your changes in a real commit
(which means it's recoverable through the reflog if necessary, unlike `stash`ed
objects). It's not your _actual_ branch, but instead a _shelf_ branch; the name
is formatted as `shelf/you@domain.com/branch-name`.

## Installation

### Pre-built packages

Packages are available for the following distributions:

* **Arch Linux**: [`aur/git-shelf`][archlinux/aur/git-shelf]

[archlinux/aur/git-shelf]: https://aur.archlinux.org/packages/git-shelf

For other distributions, see below.

### Build from source

Obtain the source by cloning [this repository][gh/sudoforge/git-shelf] or
by downloading the tarball of a [release][gh/sudoforge/git-shelf/releases].
Then run `make install` from the source root.

```
$ git clone https://github.com/sudoforge/git-shelf.git
$ cd git-shelf
$ git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
$ [sudo] make install
```

[gh/sudoforge/git-shelf]: https://github.com/sudoforge/git-shelf.git
[gh/sudoforge/git-shelf/releases]: https://github.com/sudoforge/git-shelf/releases

## Usage

`git shelf`

- To store your local changes on your remote, simply run `git shelf`. This 
creates a local commit with your changes (and the message `SHELF`), and 
creates a new branch on `origin`, aptly named 
`shelf/you@domain.com/your-original-branch-name`. That's all there is to it!

`git unshelf`

- To undo the local shelf commit and delete the remote branch, run `git
unshelf`. This can be ran from _any_ machine, as long as you have the same
`user.email` set in your `.gitconfig`, and as long as you are checked out
on the branch that you have shelved remotely.
