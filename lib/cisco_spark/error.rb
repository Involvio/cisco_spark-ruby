module CiscoSpark
  class Error
    attr_reader :http_response, :code, :message

    def initialize(http_response)
      @http_response = http_response
      @code = http_response.code.to_i
      @message = JSON.parse(http_response.body)['message']
    end

    def valid?
      (200..299).include?(@code) ? true : false
    end
  end
end
