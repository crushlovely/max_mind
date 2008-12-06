module MaxMind
  class CountryService < Service

    self.base_path = '/a'

    def parsed_response
      if self.valid_response?
        parsed_response = CSV.parse_line(self.response)
        {
          :country => parsed_response[0],
          :api_response => self.response
        }
      else
        {
          :api_response => self.response
        }
      end
    end

    def valid_response?
      super && !(self.response =~ /\(NULL\),(.+?)/)
    end

  end
end