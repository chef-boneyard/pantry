# pantry Cookbook

Pantry is a workstation automation cookbook and framework for Chef.

## Requirements

* ChefDK
* Privileged system access (sudo/root/administrator)

### Platform:

* OS X 10.9

See [Bugs](#bugs), below.

**Future (planned)**: Windows, Linux (Debian and RHEL families).

### Cookbooks:

* [build-essential](https://supermarket.getchef.com/cookbooks/build-essential)
* [homebrew](https://supermarket.getchef.com/cookbooks/homebrew)
* [packages](https://supermarket.getchef.com/cookbooks/packages)

## Attributes

* `node['homebrew']['casks']`: This attribute is used to install [Homebrew Casks](http://caskroom.io/), the default method for installing OS X Applications with this cookbook. It is used when including the `homebrew::install_casks` recipe, which is done by default in this cookbook's `mac_os_x` recipe. The value should be specified as an Array of [cask names](https://github.com/caskroom/homebrew-cask/tree/master/Casks).
* `node['homebrew']['formulas']`: This attribute is used to install [Homebrew Formulas](http://brew.sh/), the default method for installing "packages" on OS X with this cookbook. It is used when including the `homebrew::install_formulas` recipe, which is done by default in this cookbook's `mac_os_x` recipe. The value should be specified as an Array of [formula package names](https://github.com/Homebrew/homebrew/tree/master/Library/Formula).
* `node['packages']`: This attribute is used to install OS packages on Linux using the native package manager. It is used when including the `packages` recipe, which is done by default in this cookbook's non-OS X [recipes (`windows`, `debian` and `rhel`)](#bugs). The value should be specified as an Array of package names that are available from the distribution's package repositories.

## Recipes

### default

This recipe will include the node's platform-family recipe.

## Bugs

* [Windows support is not yet implemented](https://github.com/opscode-cookbooks/pantry/issues/1).
* [Linux support is not yet implemented](https://github.com/opscode-cookbooks/pantry/issues/2).

## License and Author

- Author: Joshua Timberman <joshua@getchef.com
- Copyright (C) 2014, Chef Software, Inc. <legal@getchef.com>

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
