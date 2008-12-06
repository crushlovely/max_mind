module MaxMind
  class CityIspOrgService < Service

    self.base_path = '/f'

    def parsed_response
      if self.valid_response?
        parsed_response = CSV.parse_line(self.response)
        {
          :country => parsed_response[0],
          :state => parsed_response[1],
          :city => parsed_response[2],
          :postal_code => parsed_response[3],
          :latitude => parsed_response[4],
          :longitude => parsed_response[5],
          :api_response => self.response
        }
      else
        {
          :api_response => self.response
        }
      end
    end

    def valid_response?
      super && !(self.response =~ /,,,,,,,,,,(.+?)/)
    end

  end
end