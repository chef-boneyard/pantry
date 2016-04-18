name              'pantry'
maintainer        'Joshua Timberman'
maintainer_email  'joshua@chef.io'
license           'Apache 2.0'
description       'Chef Pantry is a workstation automation cookbook'
version           '0.2.1'
depends           'homebrew', '~> 2.1'
depends           'chocolatey', '~> 0.2'

source_url 'https://github.com/chef-cookbooks/pantry' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/pantry/issues' if respond_to?(:issues_url)
