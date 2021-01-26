class QuestionRuby < SlackRubyBot::Bot
  command 'get-ruby' do |channel, data, _match|
    client = Slack::Web::Client.new

    uri = URI('https://slack.com/api/conversations.history')
    params = {
      token: ENV['SLACK_API_TOKEN'],
      channel: 'C01L01MN4C9',
      limit: 1,
      inclusive: true
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    res_one = JSON.parse(res.body)
    a = res_one['messages'][0]['text']
    client.chat_postMessage(channel: '#answers', text: a, as_user: true)
  end

  command 'get-html' do |channel, data, _match|
    client = Slack::Web::Client.new
    
    uri = URI('https://slack.com/api/conversations.history')
    params = {
      token: ENV['SLACK_API_TOKEN'],
      channel: 'C01KMJQ6M3M',
      limit: 1,
      inclusive: true
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    res_one = JSON.parse(res.body)
    a = res_one['messages'][0]['text']
    client.chat_postMessage(channel: '#answers', text: a, as_user: true)
  end

  command 'get-javascript' do |_channel, _data, _match|
    client = Slack::Web::Client.new

    uri = URI('https://slack.com/api/conversations.history')
    params = {
      token: ENV['SLACK_API_TOKEN'],
      channel: 'C01KEKALT3Q',
      limit: 1,
      inclusive: true
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    res_one = JSON.parse(res.body)
    a = res_one['messages'][0]['text']
    client.chat_postMessage(channel: '#answers', text: a, as_user: true)
  end
end
