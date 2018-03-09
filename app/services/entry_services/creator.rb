module EntryServices
  class Creator
    def initialize(params:)
      @params = params
    end

    def call
      return send_hint if params[:text].blank?
      return send_duplication_info if already_sent?
      entry = create_entry
      send_slack_notifications(entry)
    end

    private

    attr_reader :params

    def already_sent?
      Entry.where("user_id = ? AND created_at >= ?", user.id, Time.current - 5.minutes).exists?
    end

    def create_entry
      Entry.create!(user: user, body: params[:text])
    end

    def send_duplication_info
      SlackServices::DuplicationInfoSender.new(response_url: params[:response_url]).call
    end

    def send_hint
      SlackServices::HintSender.new(response_url: params[:response_url]).call
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
