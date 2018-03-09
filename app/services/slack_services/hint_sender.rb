module SlackServices
  class HintSender < PrivateInfoBaseSender
    private

    def message_body
      "Podaj, co stawiasz. Przykładowo: `/stawiam wódę`"
    end
  end
end
