require 'redmine'
require_dependency 'plugins/issue_listener/hooks.rb'

Redmine::Plugin.register :issue_listener do
  name 'Issue Listener plugin'
  author 'Igor Fedotenkov'
  description 'This is a plugin that listen for issue changes'
  version '0.0.1'
  url 'https://github.com/'
  author_url 'https://github.com/igorFedotenkov'
end
