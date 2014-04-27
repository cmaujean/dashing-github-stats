require 'octokit'
require 'action_view'
include ActionView::Helpers::DateHelper

config = YAML::load_file('github.yml')

Octokit.configure do |c|
  c.auto_paginate = true
  c.login = config["login"]
  c.password = config["password"]
end


SCHEDULER.every '1m', :first_in => 0 do |job|
  config["repos"].each do |name|
    r = Octokit::Client.new.repository(name)
    pulls = Octokit.pulls(name, :state => 'open').count

    send_event(name, {
      repo: name,
      issues: r.open_issues_count - pulls,
      pulls: pulls,
      forks: r.forks,
      watchers: r.subscribers_count,
      stargazers: r.stargazers_count,
      activity: time_ago_in_words(r.updated_at).capitalize
    })
  end
end
