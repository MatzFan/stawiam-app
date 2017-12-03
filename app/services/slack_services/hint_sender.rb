module SlackServices
  class HintSender
    def initialize(response_url:)
      @response_url = response_url
    end

    def call
      HTTParty.post(
        response_url,
        body: message_body,
        headers: { "Content-Type" => "application/json" },
      )
    end

    private

    attr_reader :response_url

    def message_body
      "{
        'response_type': 'empheral',
        'text': 'Podaj, co stawiasz. Przykładowo: `/stawiam wódę`'
      }"
    end
  end
end
