rbenv-chefdk: Use ChefDK with rbenv
===================================

This plugin lets you treat [ChefDK](https://downloads.chef.io/chef-dk/) as
another version in [rbenv](http://rbenv.org/).

**deprecated** ChefDK has been replaced by Chef Workstation. See the [rbenv-chef-workstation](https://github.com/docwhat/rbenv-chef-workstation) plugin instead.

Requirements
------------

-   [ChefDK](https://downloads.chef.io/chef-dk/) installed in `/opt/chefdk`

Installation
------------

### From GitHub

To install rbenv-chefdk, clone this repository into the `$(rbenv root)/plugins`
directory.

``` sh
cd $(rbenv root)/plugins
git clone <url>
```

### On macOS

On macOS, you can use [`brew`](https://brew.sh/) to install:
```
brew install rbenv-chefdk
```

**Warning:** If you've previously installed ChefDK which led you to using this
plugin, you will want to remove the profile changes recommended in the [ChefDK
install instructions](https://docs.chef.io/install_dk.html#set-system-ruby) or
in the Homebrew info gist. Otherwise `rbenv` or ChefDK will not work correctly.

Then create an empty directory in `$(rbenv root)/versions` called `chefdk`:

``` sh
$ mkdir "$(rbenv root)/versions/chefdk"
```

Finally, change to the new `chefdk` version and run `rbenv rehash`.

``` sh
$ rbenv shell chefdk
$ rbenv rehash
$ rbenv which ruby
/opt/chefdk/embedded/bin/ruby
```

That's it!

Troubleshooting
---------------

If you are having problems, try running `sanity-check.sh`:

``` sh
$ $SHELL "$(rbenv root)/plugins/rbenv-chefdk/sanity-check.sh"
```

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

### Why not just symlink `/opt/chefdk/embedded` to `$(rbenv root)/versions/chefdk`?

For the same reason we don't include `/opt/chefdk/embedded/bin`: It breaks
systems commands in unexpected ways.

### Rbenv isn't working or is using gems from the wrong place

Make sure you undid any changes recommended by the [ChefDK install
instructions](https://docs.chef.io/install_dk.html#set-system-ruby) or in the
Homebrew info gist.

Specifically, make sure you aren't calling `chef shell-init` anyplace in your
shell startup files.

### "can't find executable chef (Gem::Exception)"

This is probably because you are using
[`rbenv-bundle-exec`](https://github.com/maljub01/rbenv-bundle-exec).

You'll have to tell `rbenv-bundle-exec` to ignore a bunch of binaries that are
only in ChefDK:

``` sh
echo chef >> ~/.no_bundle_exec
echo berks >> ~/.no_bundle_exec
```

Questions?
----------

You can reach me at [docwhat.org](https://docwhat.org/email/) or as docwhat on
[Freenode IRC](https://freenode.net/).

License
-------

Copyright (c) 2015,2016 Christian Höltje - Released under the MIT License (see
the
`LICENSE` file)

Note on Patches/Pull Requests
-----------------------------

-   Fork the project.
-   Make your feature addition or bug fix.
-   Add tests for it. This is important so I don't break it in a future
    version unintentionally.
-   Commit
-   Send me a pull request. Bonus points for topic branches.
