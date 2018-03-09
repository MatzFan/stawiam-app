module SlackServices
  class PrivateInfoBaseSender
    def initialize(response_url:)
      @response_url = response_url
    end

    def call
      HTTParty.post(
        response_url,
        body: body,
        headers: { "Content-Type" => "application/json" },
      )
    end

    private

    attr_reader :response_url

    def body
      "{
        'response_type': 'empheral',
        'text': '#{message_body}'
      }"
    end

    def message_body
      raise NotImplementedError
    end
  end
end
