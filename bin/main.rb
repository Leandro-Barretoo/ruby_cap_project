require 'slack-ruby-bot'
require 'net/http'
require 'uri'
require 'json'
require 'dotenv'
require_relative '../lib/commands/get_question'
require_relative '../lib/commands/reply_question'

Dotenv.load('.env')

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

class MainBot < SlackRubyBot::Bot
  QuestionRuby.new
  Reply.new
end

MainBot.run
