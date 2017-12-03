module EntryServices
  class Creator
    def initialize(params:)
      @params = params
    end

    def call
      entry = create_entry
      send_slack_notifications(entry)
    end

    private

    attr_reader :params

    def create_entry
      Entry.create!(user: user, body: params[:text])
    end

    def send_slack_notifications(entry)
      SlackServices::Notifier.new(
        entry: entry,
        response_url: params[:response_url],
        user_name: params[:user_name],
      ).call
    end

    def user
      User.find_or_create_by!(user_uuid: params[:user_id])
    end
  end
end
