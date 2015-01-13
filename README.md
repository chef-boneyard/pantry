# pantry Cookbook

Pantry is a workstation automation cookbook and cookbook framework for Chef. The intention is that this cookbook handles common annoyances and holds primitives usable for other workstation automation cookbooks to take over. For example, features not yet present in homebrew or chocolatey cookbooks may be added here.

This cookbook is used as part of the [Pantry Chef Repository](https://github.com/opscode/pantry-chef-repo), and that repository is the primary entry point into using this cookbook.

There is another known project using the "pantry" name called [Ironfan Pantry](https://github.com/infochimps-labs/ironfan-pantry). This is not that project, nor related to that project.

## Requirements

* ChefDK. Use ChefDK as the Ruby install. The `pantry` script in the [Pantry Chef Repository](https://github.com/opscode/pantry-chef-repo) will make sure ChefDK is installed (or upgraded).

### Platform:

* OS X 10.9, 10.10
* Windows

Because OS X is not readily available and not redistributable as a base box for Vagrant/VMware Fusion, older versions of OS X will not be supported as it is not easily tested using test kitchen.

Windows is known to work, but this cookbook does not have test kitchen coverage until test kitchen itself fully supports Windows.

**Future (planned)**: Linux (Debian and RHEL families). See [Bugs](#bugs), below.

### Cookbooks:

* [build-essential](https://supermarket.getchef.com/cookbooks/build-essential)
* [homebrew](https://supermarket.getchef.com/cookbooks/homebrew)
* [packages](https://supermarket.getchef.com/cookbooks/packages)

## Attributes

* `node['homebrew']['casks']`: This attribute is used to install [Homebrew Casks](http://caskroom.io/), the default method for installing OS X Applications with this cookbook. It is used when including the `homebrew::install_casks` recipe, which is done by default in this cookbook's `mac_os_x` recipe. The value should be specified as an Array of [cask names](https://github.com/caskroom/homebrew-cask/tree/master/Casks).
* `node['homebrew']['formulas']`: This attribute is used to install [Homebrew Formulas](http://brew.sh/), the default method for installing "packages" on OS X with this cookbook. It is used when including the `homebrew::install_formulas` recipe, which is done by default in this cookbook's `mac_os_x` recipe. The value should be specified as an Array of [formula package names](https://github.com/Homebrew/homebrew/tree/master/Library/Formula).
* `node['packages']`: This attribute is used to install OS packages on Linux using the native package manager. It is used when including the `packages` recipe, which is done by default in this cookbook's non-OS X [recipes (`windows`, `debian` and `rhel`)](#bugs). The value should be specified as an Array of package names that are available from the distribution's package repositories.
* `node['chocolatey']['packages']`: This attribute is used to install [Chocolatey packages](https://chocolatey.org/), the recommended method for installing "packages" on Windows with this cookbook. It is used in the `windows` recipe, which is included by default on `windows` platform systems. The value should be specified as an Array of chocolatey [package names](https://chocolatey.org/packages).

**Note** Linux platforms are not officially supported by Pantry yet and things may work with or without modification.

## Recipes

### default

This recipe will include the node's platform-family recipe. For example, `mac_os_x`.

## Bugs

For issues with this cookbook specifically, [use this repository](https://github.com/opscode-cookbooks/pantry).

For issues with the pantry project as a whole, [use the pantry-chef-repo](https://github.com/opscode/pantry-chef-repo).

## License and Author

- Author: Joshua Timberman <joshua@chef.io>
- Author: Jay Mundrawala <jmundrawala@chef.io>
- Copyright (C) 2014-2015, Chef Software, Inc. <legal@chef.io>

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
