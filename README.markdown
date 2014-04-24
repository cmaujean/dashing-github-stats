# Github Stats Widget for Dashing

## Setup

1. Copy the contents of the jobs, widgets and assets/images folder contents into the (you guessed it)
   the jobs, widgets and assets/images folders in your dashing project and
   the github.yml and LICENSE files into the root of your dashing project
   (rsync works well for this.)
1. Edit the github.yml file to configure the widget.
1. Add ``` gem 'octokit' ``` to your Gemfile and run ``` bundle install ```
1. Add the following to your dashboard.erb file, and adjust the attributes to
   place it where you want:
```
<ul>
  <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
    <div data-id="github_stats" data-view="GithubStats"></div>
  </li>
</ul>
```

# AUTHOR

Christopher Maujean
christopher@maujean.org
