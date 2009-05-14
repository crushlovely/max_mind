module MaxMind
  class Service
    cattr_accessor :license_key

    cattr_accessor :base_url
    self.base_url = 'http://geoip1.maxmind.com'

    class_inheritable_accessor :base_path

    attr_accessor :response

    def self.fetch_for_ip(ip)
      raise RequestError.new("Cannot make a request without an IP address") if ip.nil?
      service = self.new
      service.make_request(ip)
      service.parsed_response
    end

    # This method should be implemented in subclasses
    # Here, we're only returning the raw data returned by the server
    def parsed_response
      self.response
    end

    def make_request(ip)
      if license_key.nil?
        raise LicenseError.new("License Key is missing")
      end

      uri = URI.parse(base_url)

      begin
        self.response = Net::HTTP.get(uri.host, build_path(:l => license_key, :i => ip), uri.port)
      rescue EOFError => e
        raise ConnectionError, "The remote server dropped the connection"
      rescue Errno::ECONNRESET => e
        raise ConnectionError, "The remote server reset the connection"
      rescue Errno::ECONNREFUSED => e
        raise ConnectionError, "The remote server refused the connection"
      rescue Timeout::Error, Errno::ETIMEDOUT => e
        raise ConnectionError, "The connection to the remote server timed out"
      end

    end

    def build_path(params = {})
      raise RequestError.new("Cannot build a valid request path!") unless !base_path.nil? && params.is_a?(Hash)
      base_path + '?' + params.to_query_string
    end

    def valid_response?
      !self.response.blank?
    end
  end
end