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

describe Reply do
  let(:check) { Reply.new }
  describe '#check' do
    it 'checks API calling code' do
      expect(check.check(ENV['SLACK_API_TOKEN']).is_a?(Hash)).to eql(true)
    end
    it 'throws an error if invalid token is given' do
      expect(check.check('someting')).to eql('Invalid token')
    end
  end
  describe '#authorization' do
    it 'checks API calling code' do
      expect(check.authorization("#{ENV['SLACK_API_TOKEN']}")['ok']).to eql(true)
    end
  end
end

describe QuestionRuby do
  let(:quest) { QuestionRuby.new }
  describe '#get_history' do
    it 'get the history of the conversations of the channel "#ruby"' do
      expect(quest.get_history('C01L01MN4C9', ENV['SLACK_API_TOKEN']).is_a?(String)).to eql(true)
    end
    it 'get the history of the conversations of the channel "#html-css"' do
      expect(quest.get_history('C01KMJQ6M3M', ENV['SLACK_API_TOKEN']).is_a?(String)).to eql(true)
    end
    it 'get the history of the conversations of the channel "#javascript"' do
      expect(quest.get_history('C01KEKALT3Q', ENV['SLACK_API_TOKEN']).is_a?(String)).to eql(true)
    end
    it 'throws an error if there is no valid token' do
      expect(quest.get_history('C01L01MN4C9', 'something')).to eql('Invalid token')
    end
  end
end