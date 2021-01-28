require 'dotenv'
require 'faraday'

Dotenv.load('.env')

class QuestionRuby < SlackRubyBot::Bot
  def get_history(chan, tok)
    if tok == ENV['SLACK_API_TOKEN']
      uri = URI('https://slack.com/api/conversations.history')
      params = {
        token: tok,
        channel: chan,
        limit: 1,
        inclusive: true
      }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      res_one = JSON.parse(res.body)
      a = res_one['messages'][0]['text']
      return a
    else
      return 'Invalid token'
    end
  end

  def get_quest(channel, text)
    slack_token = ENV['SLACK_API_TOKEN']
    body = {
      as_user: true,
      channel: channel,
      text: text
    }

    Faraday.new('https://slack.com') do |c|
      c.request :url_encoded
      c.adapter Faraday.default_adapter
    end.post("/api/chat.postMessage?token=#{slack_token}", body)
  end

  command 'get-ruby' do
    hist = QuestionRuby.new
    get = hist.get_history('C01L01MN4C9', ENV['SLACK_API_TOKEN'])
    hist.get_quest('#answers', get)
  end

  command 'get-html' do
    hist = QuestionRuby.new
    get = hist.get_history('C01KMJQ6M3M', ENV['SLACK_API_TOKEN'])
    hist.get_quest('#answers', get)
  end

  command 'get-javascript' do
    hist = QuestionRuby.new
    get = hist.get_history('C01KEKALT3Q', ENV['SLACK_API_TOKEN'])
    hist.get_quest('#answers', get)
  end
end
