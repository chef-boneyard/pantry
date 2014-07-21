# pantry Cookbook

## Requirements

### Platform:

### Cookbooks:

## Attributes

## Recipes

## Testing

The cookbook provides the following Rake tasks for testing:

    rake foodcritic                   # Lint Chef cookbooks
    rake integration                  # Alias for kitchen:all
    rake kitchen:all                  # Run all test instances
    rake kitchen:default-ubuntu-1204  # Run default-ubuntu-1204 test instance
    rake rubocop                      # Run RuboCop style and lint checks
    rake spec                         # Run ChefSpec examples
    rake test                         # Run all tests

## License and Author

- Author: YOUR_NAME
- Copyright (C) YEAR YOUR_NAME_OR_COMPANY

All rights reserved.

This is a pantry example of a private cookbook that isn't shared externally. For a public cookbook example, see [Mathias Lafeldt's pantry cookboko](https://github.com/mlafeldt/pantry-cookbook).
