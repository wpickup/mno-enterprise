# mno-enterprise
Maestrano Enterprise Engine

## Install

Add mno-enterprise to your Gemfile (repo currently private)
```ruby
gem 'mno-enterprise', git: 'git@github.com:maestrano/mno-enterprise.git'
```

Run the install script
```bash
$ rails g mno_enterprise:install
```

## Deploy a Puma stack on EC2 via Webistrano/Capistrano
First, prepare your server. You will find a pre-made AMI on our AWS accounts called "AppServer" or "Rails Stack" that you can use.

Then, setup your new project via webistrano/capistrano.

When you're done, you can prepare the project by running the following generator for each environment your need to deploy (uat, production etc.)
```bash
# rails g mno_enterprise:puma_stack <environment>
$ rails g mno_enterprise:puma_stack production
```
This generator creates a script folder with all the configuration files required by nginx, puma, upstart and monit.

Perform a deploy:cold via webistrano/capistrano (which will certainly fail). The whole codebase will be copied to the server.

Login to the server then run the following setup script
```bash
# sh /apps/<project-name>/current/scripts/<environment>/setup.sh
$ sh /apps/my-super-app/current/scripts/production/setup.sh
```
This script will setup a bunch of symlinks for nginx, upstart and monit pointing to the config files located under the scripts directory created previously.

That's it. You should be done!

## Loader gif Reference
**bg-main**
http://spiffygif.com/?color=ebe5ff&lines=8&bgColor=aeb5bf&length=4&radius=7&width=4&halo=false

**bg-inverse**
http://spiffygif.com/?color=977bf0&lines=8&length=4&radius=7&width=4&halo=false
