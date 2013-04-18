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

Ruby
----

This branch provides a Ruby based setup to test drive a CSP
solver. We use [rvm][] to manage our ruby versions and gemsets. There
is a `.rvmrc` with the following content in the directory.

```ruby
#!/usr/bin/env bash

# This is an RVM Project .rvmrc file, used to automatically load the ruby
# development environment upon cd'ing into the directory

# First we specify our desired <ruby>[@<gemset>], the @gemset name is optional,
# Only full ruby name is supported here, for short names use:
#     echo "rvm use 1.9.3" > .rvmrc
environment_id="ruby-1.9.3-p392@SPA.CSP"

# Uncomment the following lines if you want to verify rvm version per project
# rvmrc_rvm_version="1.19.5 (stable)" # 1.10.1 seams as a safe start
# eval "$(echo ${rvm_version}.${rvmrc_rvm_version} | awk -F. '{print "[[ "$1*65536+$2*256+$3" -ge "$4*65536+$5*256+$6" ]]"}' )" || {
#   echo "This .rvmrc file requires at least RVM ${rvmrc_rvm_version}, aborting loading."
#   return 1
# }

# First we attempt to load the desired environment directly from the environment
# file. This is very fast and efficient compared to running through the entire
# CLI and selector. If you want feedback on which environment was used then
# insert the word 'use' after --create as this triggers verbose mode.
if [[ -d "${rvm_path:-$HOME/.rvm}/environments"
  && -s "${rvm_path:-$HOME/.rvm}/environments/$environment_id" ]]
then
  \. "${rvm_path:-$HOME/.rvm}/environments/$environment_id"
  for __hook in "${rvm_path:-$HOME/.rvm}/hooks/after_use"*
  do
    if [[ -f "${__hook}" && -x "${__hook}" && -s "${__hook}" ]]
    then \. "${__hook}" || true
    fi
  done
  unset __hook
else
  # If the environment file has not yet been created, use the RVM CLI to select.
  rvm --create  "$environment_id" || {
    echo "Failed to create RVM environment '${environment_id}'."
    return 1
  }
fi

#If you use bundler, this might be useful to you:
if [[ -s Gemfile ]] && {
  ! builtin command -v bundle >/dev/null ||
  builtin command -v bundle | GREP_OPTIONS= \grep $rvm_path/bin/bundle >/dev/null
}
then
  printf "%b" "The rubygem 'bundler' is not installed. Installing it now.\n"
  gem install bundler
fi
if [[ -s Gemfile ]] && builtin command -v bundle >/dev/null
then
  bundle install | GREP_OPTIONS= \grep -vE '^Using|Your bundle is complete'
fi
```

We use [bundler][] to manage our dependencies. It is automatically
installed by `.rvmrc` but if anything went wrong install it with

    gem install bundler

Afterwards the project dependencies get installed. If you want to
validate it by hand execute

    bundle install

Now [cucumber][] can be run with

    bundle exec cucumber

or just plain

    cucumber

[spa2013]: www.spaconference.org/spa2013/ "SPA 2013 homepage"
[trello]: https://trello.com/board/spa2013-csp/51475c3523c6c70e3c001f03
[cucumber]: http://cukes.info/ "Cucumber homepage"
[rvm]: https://rvm.io/
[bundler]: http://gembundler.com/
[gem]: http://rubygems.org/
