module SlackServices
  class DuplicationInfoSender < PrivateInfoBaseSender
    private

    def message_body
      "Wyluzuj, nie duplikuj stawiania!"
    end
  end
end
