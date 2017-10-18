module SlackServices
  class ChannelMessageSender
    def initialize(user_name:)
      @user_name = user_name
    end

    def call
      HTTParty.post(
        AppConfig.slack.channel_webhook_url,
        body: channel_message,
        headers: { "Content-Type" => "application/json" },
      )
    end

    private

    attr_reader :user_name

    def channel_message
      "{ \"text\": \"*@here* UWAGA! Wóda dla wszystkich dzięki <@#{user_name}> \" }"
    end
  end
end
