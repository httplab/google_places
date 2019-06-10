module GooglePlaces
  class JsonParser < HTTParty::Parser
    class Error < StandardError
      attr_reader :body

      def initialize(msg, body)
        @body = body
        super(msg)
      end
    end

    protected

    def json
      JSON.parse(body, quirks_mode: true, allow_nan: true)
    rescue JSON::ParserError => e
      raise Error.new(e.message, body)
    end
  end
end
