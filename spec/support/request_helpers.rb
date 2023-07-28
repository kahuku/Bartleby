module Support
  module RequestHelpers
    def response_body
      JSON.parse(response.body)
    end

    def response_data
      response_body['data']
    end

    def response_errors
      response_body['errors']
    end

    def response_error
      response_body['error']
    end
  end
end
