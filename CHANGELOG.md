# v0.2.0

* Initial Windows support (Thanks Jay!)
* Remove management of homebrew-cask directories on OS X, this is delegated to homebrew cookbook v1.11.0
* Update dependency on homebrew cookbook to version 1.11.0.
* Remove build-essential dependency, that is a dependency of homebrew, and we want to avoid potential version conflicts.

# v0.1.3

* Include build-essential and homebrew recipes in `mac_os_x` recipe (#4)

# v0.1.2

* Remove plist installation and plugin loading

# v0.1.1

* Ensure `/Library/Caches` has correct permissions for homebrew cask.
* Adds testing for OS X 10.10.
* First public release to supermarket.

# v0.0.2

* Doc update release

# v0.0.1

* Initial release
