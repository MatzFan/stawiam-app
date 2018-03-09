module SlackServices
  class HintSender < SlackServices::PrivateInfoBaseSender
    private

    def message_body
      "Podaj, co stawiasz. Przykładowo: `/stawiam wódę`"
    end
  end
end
