module SlackServices
  class SlackbotMessageSender
    def initialize(user_name:, user_uuid:)
      @user_name = user_name
      @user_uuid = user_uuid
    end

    def call
      HTTParty.post(
        AppConfig.slack.incoming_webhook_url,
        body: message_body,
      )
    end

    private

    attr_reader :user_name, :user_uuid

    def message_body
      message = "Hej, otrzymujesz tę wiadomość, ponieważ nie dbasz o bezpieczeństwo! "\
                "Następnym razem zablokuj swój komputer nim odejdziesz od biurka."
      "{
        'channel': '@#{user_name}',
        'username': 'Stawiam App',
        'text': '#{message}'
      }"
    end
  end
end
