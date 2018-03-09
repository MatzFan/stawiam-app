module SlackServices
  class DuplicationInfoSender
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
        'text': 'Wyluzuj, nie duplikuj stawiania!'
      }"
    end
  end
end
