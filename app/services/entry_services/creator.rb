module EntryServices
  class Creator
    def initialize(params:)
      @params = params
    end

    def call
      create_entry
      send_slack_notification
    end

    private

    attr_reader :params

    def create_entry
      Entry.create!(user: user)
    end

    def send_slack_notification
      SlackServices::Notifier.new(
        user_name: params[:user_name],
        user_uuid: params[:user_id],
      ).call
    end

    def user
      User.find_or_create_by!(user_uuid: params[:user_id])
    end
  end
end
