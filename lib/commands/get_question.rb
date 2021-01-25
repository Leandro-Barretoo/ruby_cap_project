class Question_Ruby < SlackRubyBot::Bot
	    command 'get-ruby' do |channel, data, _match|
			client = Slack::Web::Client.new
			uri = URI.parse("https://slack.com/api/conversations.list")
			request = Net::HTTP::Get.new(uri)
			request.content_type = 'application/x-www-form-urlencoded'
			request['Authorization'] = "Bearer #{ENV['SLACK_API_TOKEN']}"
			req_options = {
				use_ssl: uri.scheme == 'https',
			}
			response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
				http.request(request)
			end
			ans = JSON.pretty_generate(JSON.parse(response.body))
	
			uri = URI("https://slack.com/api/conversations.history")
			params = {
				token: ENV['SLACK_API_TOKEN'],
				channel: 'C01L01MN4C9',
				limit: 1,
				inclusive: true
			}
			uri.query = URI.encode_www_form(params)
			res = Net::HTTP.get_response(uri)
			res_one = JSON.parse(res.body)
			a = res_one["messages"][0]["text"]
			client.chat_postMessage(channel: '#answers', text: a, as_user: true)
		end

		command 'get-html' do |channel, data, _match|
			client = Slack::Web::Client.new
			uri = URI.parse("https://slack.com/api/conversations.list")
			request = Net::HTTP::Get.new(uri)
			request.content_type = 'application/x-www-form-urlencoded'
			request['Authorization'] = "Bearer #{ENV['SLACK_API_TOKEN']}"
			req_options = {
				use_ssl: uri.scheme == 'https',
			}
			response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
				http.request(request)
			end
			ans = JSON.pretty_generate(JSON.parse(response.body))
	
	
			uri = URI("https://slack.com/api/conversations.history")
			params = {
				token: ENV['SLACK_API_TOKEN'],
				channel: 'C01KMJQ6M3M',
				limit: 1,
				inclusive: true
			}
			uri.query = URI.encode_www_form(params)
			res = Net::HTTP.get_response(uri)
			res_one = JSON.parse(res.body)
			a = res_one["messages"][0]["text"]
			client.chat_postMessage(channel: '#answers', text: a, as_user: true)
		end

		command 'get-javascript' do |channel, data, _match|
			client = Slack::Web::Client.new
			uri = URI.parse("https://slack.com/api/conversations.list")
			request = Net::HTTP::Get.new(uri)
			request.content_type = 'application/x-www-form-urlencoded'
			request['Authorization'] = "Bearer #{ENV['SLACK_API_TOKEN']}"
			req_options = {
				use_ssl: uri.scheme == 'https',
			}
			response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
				http.request(request)
			end
			ans = JSON.pretty_generate(JSON.parse(response.body))
	
	
			uri = URI("https://slack.com/api/conversations.history")
			params = {
				token: ENV['SLACK_API_TOKEN'],
				channel: 'C01KEKALT3Q',
				limit: 1,
				inclusive: true
			}
			uri.query = URI.encode_www_form(params)
			res = Net::HTTP.get_response(uri)
			res_one = JSON.parse(res.body)
			a = res_one["messages"][0]["text"]
			client.chat_postMessage(channel: '#answers', text: a, as_user: true)
		end
end