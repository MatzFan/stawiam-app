module SlackServices
  class Notifier
    def initialize(entry:, response_url:, user_name:)
      @entry = entry
      @response_url = response_url
      @user_name = user_name
    end

    def call
      fetch_user_info
      send_channel_notification
      send_slackbot_private_message
    end

    private

    attr_reader :entry, :response_url, :user_name

    def fetch_user_info
      SlackServices::UserInfoFetcher.new(user_uuid: user_uuid).call
    end

    def send_channel_notification
      SlackServices::ChannelMessageSender.new(
        entry: entry,
        response_url: response_url,
        user_name: user_name,
      ).call
    end

    def send_slackbot_private_message
      SlackServices::SlackbotMessageSender.new(
        user_name: user_name,
        user_uuid: user_uuid,
      ).call
    end

    def user_uuid
      @user_uuid ||= entry.user.user_uuid
    end
  end
end
