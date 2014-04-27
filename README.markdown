# Github Stats Widget for Dashing

## Setup

1. Copy the contents of the jobs, widgets and assets/images folder contents into the (you guessed it)
   the jobs, widgets and assets/images folders in your dashing project and
   the github.yml and LICENSE files into the root of your dashing project
   (rsync works well for this.)
1. Edit the github.yml file to configure the widget. The configuration looks like this:
```yaml
repos: 
  - dotcloud/docker
  - erikh/ruby-dbi
  - rack/rack
  - torvalds/linux

login: my_github_user
password: my_github_password
```
1. Add `octokit` and `action_view` gems to your Gemfile and run `bundle install`
1. Add the following to your dashboard.erb file, and adjust the attributes to
   place it where you want. The data-id value is the same as your repository name:
```html
<ul>
  <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
    <div data-id="dotcloud/docker" data-view="GithubStats"></div>
  </li>
</ul>
```
1. Copy the above snippet as necessary for each repository in your configuration.

# AUTHOR

* Christopher Maujean <christopher@maujean.org>
* Erik Hollensbe <github@hollensbe.org>
