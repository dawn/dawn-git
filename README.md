Dawn-Git
========
[link](https://github.com/dawn/dawn-git)

[![Dependency Status](https://gemnasium.com/dawn/dawn-git.svg)](https://gemnasium.com/dawn/dawn-git)
[![Gem Version](https://badge.fury.io/rb/dawn-git.svg)](http://badge.fury.io/rb/dawn-git)
[![Code Climate](https://codeclimate.com/github/dawn/dawn-git.png)](https://codeclimate.com/github/dawn/dawn-git)

Dawn remote repository management server
[Dawn](https://github.com/dawn/dawn)

## Installation
```shell
gem install dawn-git
```

## Usage
### Server
First run the server as the repo user (default: "git")
```shell
dawn-git-server --config-file my_config.yml
```

### Client API
```ruby
# NOTE: this will load the dawn/git/api
# not the dawn/git/server
require "dawn/git"

# if you're lazy like me
include Dawn::Git::Api

Repos.all #=> list of all repos on the git server
Repos.create username: "IceDragon", reponame: "CookieCrusher"

```
