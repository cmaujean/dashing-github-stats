require 'octokit'

config = YAML::load_file('github.yml')

Octokit.configure do |c|
  c.auto_paginate = true
  c.login = config["login"]
  c.password = config["password"]
end


SCHEDULER.every '1m', :first_in => 0 do |job|
  r = Octokit::Client.new.repository(config["repo"])
  pulls = Octokit.pulls(config["repo"], :state => 'open').count

  send_event('github_stats', {
    repo: config["repo"],
    issues: r.open_issues_count,
    pulls: pulls,
    forks: r.forks,
    watchers: r.subscribers_count,
    stargazers: r.stargazers_count
  })
end
