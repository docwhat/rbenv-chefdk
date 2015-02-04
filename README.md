# rbenv-chefdk: Use ChefDK with rbenv

This plugin lets you treat [ChefDK](https://downloads.chef.io/chef-dk/) as
another version in [rbenv](http://rbenv.org/).

## Installation

To install rbenv-chefdk, clone this repository into the `$RBENV_ROOT/plugins`
directory.  This is usually `~/.rbenv/plugins` or
`/usr/local/var/rbenv/plugins` if you use [Homebrew](http://brew.sh/) on OS X.

Then symlink your ChefDK embedded directory into your `$RBENV_ROOT/versions`
directory.  For example:

``` sh
ln -nsf /opt/chefdk/embedded/ $RBENV_ROOT/versions/chefdk
```

It works as long as the directory in `$RBENV_ROOT/versions` begins with
`chefdk`.

That's it!

## What rbenv-chefdk is doing...

All this does is modify `rbenv which` to be able to find gems that ChefDK
installs into your `~/.chefdk/` directory.  ChefDK does this so it doesn't
cross-contaminate the `/opt/chefdk` with multiple user's gems.

The `rbenv which` command is used by all the internal rbenv plumbing, including
the shims and `rbenv exec`.

## Questions?

You can reach me at [docwhat.org](https://docwhat.org/email/) or as docwhat on
[Freenode IRC](https://freenode.net/).

## License

Copyright (c) 2015 Christian Höltje - Released under the MIT License (see the
`LICENSE` file)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit
* Send me a pull request. Bonus points for topic branches.

