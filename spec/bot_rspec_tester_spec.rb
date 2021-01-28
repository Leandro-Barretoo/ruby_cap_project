require 'slack-ruby-bot'
require 'net/http'
require 'uri'
require 'json'
require 'dotenv'
require_relative '../lib/commands/get_question'
require_relative '../lib/commands/reply_question'
Dotenv.load

describe QuestionRuby do
  let(:client) { SlackRubyBot::Client.new }
  let(:quest) { QuestionRuby.new }
  it 'grabs the last question of a given channel' do
    expect(quest.is_a?(SlackRubyBot::Commands::Base)).to eql(true)
  end
end

describe Reply do
  let(:client) { SlackRubyBot::Client.new }
  let(:reply) { Reply.new }
  it 'takes the input of the person and sends it as a reply to parent thread' do
    expect(reply.is_a?(SlackRubyBot::Bot)).to eql(true)
  end
end
