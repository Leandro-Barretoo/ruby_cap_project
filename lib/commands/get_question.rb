require 'dotenv'

Dotenv.load('.env')

class QuestionRuby < SlackRubyBot::Bot
  def get_history(chan, tok)
    client = Slack::Web::Client.new
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
    client.chat_postMessage(channel: '#answers', text: a, as_user: true)
  end

  command 'get-ruby' do
    hist = QuestionRuby.new
    hist.get_history('C01L01MN4C9', ENV['SLACK_API_TOKEN'])
  end

  command 'get-html' do
    hist = QuestionRuby.new
    hist.get_history('C01KMJQ6M3M', ENV['SLACK_API_TOKEN'])
  end

  command 'get-javascript' do
    hist = QuestionRuby.new
    hist.get_history('C01KEKALT3Q', ENV['SLACK_API_TOKEN'])
  end
end
