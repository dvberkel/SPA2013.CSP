SPA 2013 Advanced Problem Solving: Constraint Satisfaction Problems
===================================================================

This repository accompanies a [SPA 2013][spa2013] session 
"Advanced Problem Solving: Constraint Satisfaction Problems"

Want to know where I am working on? Check out the
[trello board][trello].

Features
--------

This repository exposes a [cucumber][] feature that enables a
developer to test drive a Constraint Satisfaction Problem solver.

Checkout a branch for your favourite language and get started.

Java
----

This branch provides a Java based setup to test drive a CSP solver. We
use [maven][] to automate various tasks.

    mvn eclipse:eclipse

will create projects files which can be imported into Eclipse.

[cucumber-jvm][] is a port from cucumber used to run the features. Run
the test inside your integrated development environment to get started.

[spa2013]: www.spaconference.org/spa2013/ "SPA 2013 homepage"
[trello]: https://trello.com/board/spa2013-csp/51475c3523c6c70e3c001f03
[cucumber]: http://cukes.info/ "Cucumber homepage"
[maven]: http://maven.apache.org/
[cucumber-jvm]: https://github.com/cucumber/cucumber-jvm
