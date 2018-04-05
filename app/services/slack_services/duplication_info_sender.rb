require_relative "private_info_base_sender"

module SlackServices
  class DuplicationInfoSender < PrivateInfoBaseSender
    private

    def message_body
      "Wyluzuj, nie duplikuj stawiania!"
    end
  end
end
