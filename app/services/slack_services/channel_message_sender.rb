module SlackServices
  class ChannelMessageSender
    def initialize(entry:, response_url:, user_name:)
      @entry = entry
      @response_url = response_url
      @user_name = user_name
    end

    def call
      HTTParty.post(
        response_url,
        body: channel_message,
        headers: { "Content-Type" => "application/json" },
      )
    end

    private

    attr_reader :entry, :response_url, :user_name

    def channel_message
      "{
        'response_type': 'in_channel',
        'text': '*@here* UWAGA! <@#{user_name}> stawia #{entry.body}'
      }"
    end
  end
end
