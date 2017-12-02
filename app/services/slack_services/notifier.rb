module SlackServices
  class Notifier
    def initialize(user_name:, user_uuid:)
      @user_name = user_name
      @user_uuid = user_uuid
    end

    def call
      fetch_user_info
      send_channel_notification
      send_slackbot_private_message
    end

    private

    attr_reader :user_name, :user_uuid

    def fetch_user_info
      SlackServices::UserInfoFetcher.new(user_uuid: user_uuid).call
    end

    def send_channel_notification
      SlackServices::ChannelMessageSender.new(user_name: user_name).call
    end

    def send_slackbot_private_message
      SlackServices::SlackbotMessageSender.new(
        user_name: user_name,
        user_uuid: user_uuid,
      ).call
    end
  end
end
