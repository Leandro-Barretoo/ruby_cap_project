# frozen_string_literal: true

require_relative '../lib/commands/get_question.rb'

Slack.configure do |config|
	config.token = ENV['SLACK_API_TOKEN']
	raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

class PongBot < SlackRubyBot::Bot
	ruby_quest = Question_Ruby.new
end

PongBot.run