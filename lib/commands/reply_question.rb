class Reply < SlackRubyBot::Bot
	command 'reply' do |channel, data, _match|
		channel_name = data.text.split(' ', 3)[1]
		reply_text = data.text.split(' ', 3)[-1]

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
		ans = JSON.parse(response.body)

		channel_id = 0
		ans["channels"].each do |i|
			if i["name"] == channel_name
				channel_id = i["id"]
			end
		end

		client = Slack::Web::Client.new
		uri = URI("https://slack.com/api/conversations.history")
		params = {
			token: ENV['SLACK_API_TOKEN'],
			channel: channel_id,
			limit: 1,
			inclusive: true
		}
		uri.query = URI.encode_www_form(params)
		res = Net::HTTP.get_response(uri)
		res_one = JSON.parse(res.body)
		quest_ts = res_one["messages"][0]["ts"]
		client.chat_postMessage(channel: "#{channel_id}", text: "#{reply_text}", as_user: true, thread_ts: "#{quest_ts}")
	end
end