SPA 2013 Advanced Problem Solving: Constraint Satisfaction Problems
===================================================================

This repository accompanies a [SPA 2013][spa2013] session 
"Advanced Problem Solving: Constraint Satisfaction Problems"

Want to know where I am working on? Check out the
[trello board][trello].

Presentation
------------

This branch holds a [deck][] presentation accompanying the session.

> [deck.js][deck] is a great tool for creating modern HTML
> presentation. Overtime I created a custom set of tools. 
> This project can be used as a starting point for the creation
> of a custom presentation.

### Getting Started

Create a git repository, add this repository as a remote, fetch the content
and merge the master branch.

    mkdir example-presentation
    cd example-presentation
    git init
    git remote add base git://github.com/dvberkel/deck-base.git
    git fetch base
    git merge origin/master

The repository uses submodules which need to be correctly initialized.

    git submodule init
    git submodule update

[spa2013]: www.spaconference.org/spa2013/ "SPA 2013 homepage"
[trello]: https://trello.com/board/spa2013-csp/51475c3523c6c70e3c001f03
[deck]: http://imakewebthings.com/deck.js/
