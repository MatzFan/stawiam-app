module SlackServices
  class UserInfoFetcher
    def initialize(user_uuid:)
      @user_uuid = user_uuid
    end

    def call
      update_user_attributes
    end

    private

    attr_reader :user_uuid

    def api_response
      @api_response ||= begin
        HTTParty.get(
          AppConfig.slack.users_api_endpoint,
          query: {
            token: AppConfig.slack.api_token,
            user: user_uuid,
          },
        ).parsed_response.deep_symbolize_keys
      end
    end

    def user
      User.find_by(user_uuid: user_uuid)
    end

    def update_user_attributes
      user.update!(
        full_name: api_response.dig(:user, :real_name),
        avatar_url: api_response.dig(:user, :profile, :image_512),
      )
    end
  end
end
