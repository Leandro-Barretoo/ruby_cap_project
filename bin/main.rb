require 'slack-ruby-bot'
require 'net/http'
require 'uri'
require 'json'
require 'dotenv'
require_relative '../lib/commands/get_question.rb'
require_relative '../lib/commands/reply_question.rb'

Dotenv.load

Slack.configure do |config|
	config.token = ENV['SLACK_API_TOKEN']
	raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

class MainBot < SlackRubyBot::Bot
	ruby_quest = QuestionRuby.new
	ruby_reply = Reply.new
end

MainBot.run