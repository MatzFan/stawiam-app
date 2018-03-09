module SlackServices
  class DuplicationInfoSender < SlackServices::PrivateInfoBaseSender
    private

    def message_body
      "Wyluzuj, nie duplikuj stawiania!"
    end
  end
end
