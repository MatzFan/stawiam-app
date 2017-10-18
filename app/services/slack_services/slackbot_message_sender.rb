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
      "{
        'channel': '@#{user_name}',
        'username': 'Stawiam wódę app',
        'text': 'Hej, Otrzymujesz tę wiadomość, ponieważ nie dbasz o bezpieczeństwo! Następnym razem zablokuj swój komputer. :wink:'
      }"
    end
  end
end
