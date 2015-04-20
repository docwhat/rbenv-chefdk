rbenv-chefdk: Use ChefDK with rbenv
===================================

This plugin lets you treat [ChefDK](https://downloads.chef.io/chef-dk/) as
another version in [rbenv](http://rbenv.org/).

Requirements
------------

-   [ChefDK](https://downloads.chef.io/chef-dk/) installed in `/opt/chefdk`

Installation
------------

To install rbenv-chefdk, clone this repository into the $RBENV_ROOT/plugins directory.

````
cd $RBENV_ROOT/plugins
git clone <url> 
````

$RBENV_ROOT is usually ~/.rbenv/plugins or /usr/local/var/rbenv/plugins if you follow the suggestion in Homebrew on OS X.

Then create an empty directory in `$RBENV_ROOT/versions` called `chefdk`:

``` sh
$ mkdir "$RBENV_ROOT/versions/chefdk"
```

Finally, change to the new `chefdk` version and run `rbenv rehash`.

``` sh
$ rbenv shell chefdk
$ rbenv rehash
$ rbenv which ruby
/opt/chefdk/embedded/bin/ruby
```

That's it!

What rbenv-chefdk is doing...
-----------------------------

rbenv-chefdk modifies `rbenv which` and `rbenv rehash` to search for
executables in:

1.  `~/.chefdk/gem/ruby/<ruby_lib_version>/bin` -- When you install gems in
    ChefDK, this is where gems are installed when using the ChefDK.
2.  `/opt/chefdk/bin` -- These are the normal commands for using chef.
3.  `/opt/chefdk/embedded/bin` -- This is only added to `rbenv which` and
    partially to `rbenv rehash`. Some of the commands here would break your
    system if shims were created for them.
4.  `/opt/chefdk/embedded/lib/ruby/gems/<ruby_lib_version>/bin` -- These are
    the gems that ChefDK pre-installed for you.

The `rbenv which` command is used by all the internal rbenv plumbing, including
the shims and `rbenv exec`.

The `rbenv rehash` command generates the shims you are actually using when you
run a command that came with ruby or a gem.

Frequently Asked Questions
--------------------------

### Hey, what happened to `gem`?

With the ChefDK you have to use `chef gem` instead.

### Why don't you include `/opt/chefdk/embedded/bin`?

We don't fully include the `/opt/chefdk/embedded/bin` directory because it'll
break your system in subtle ways.

`/opt/chefdk/embedded/bin` has commands like `clear`, `tput`, `xsltproc`, and
`xz`. These are commands that are part of your system and are only included in
ChefDK so it gets reliable results across platforms.

If we made shims of these commands, your system might break when not using
chefdk and can produce unexpected results even if you were using chefdk if your
version of these commands are different (e.g. Gnu vs. BSD or version).

### Why not just symlink `/opt/chefdk/embedded` to `$RBENV_ROOT/versions/chefdk`?

For the same reason we don't include `/opt/chefdk/embedded/bin`: It breaks
systems commands in unexpected ways.

Questions?
----------

You can reach me at [docwhat.org](https://docwhat.org/email/) or as docwhat on
[Freenode IRC](https://freenode.net/).

License
-------

Copyright (c) 2015 Christian Höltje - Released under the MIT License (see the
`LICENSE` file)

Note on Patches/Pull Requests
-----------------------------

-   Fork the project.
-   Make your feature addition or bug fix.
-   Add tests for it. This is important so I don't break it in a future version
    unintentionally.
-   Commit
-   Send me a pull request. Bonus points for topic branches.
