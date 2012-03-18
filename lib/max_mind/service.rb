module MaxMind
  class Service
    class << self
      @@base_url = 'http://geoip.maxmind.com'

      def license_key
        @@license_key
      end

      def license_key=(key)
        @@license_key = key
      end

      def base_url
        @@base_url
      end

      def base_url=(url)
        @@base_url = url
      end

      attr_accessor :base_path

      def fetch_for_ip(ip)
        raise RequestError.new("Cannot make a request without an IP address") if ip.nil?
        service = self.new
        service.make_request(ip)
        service.parsed_response
      end
    end

    attr_accessor :response

    # This method should be implemented in subclasses
    # Here, we're only returning the raw data returned by the server
    def parsed_response
      response
    end

    def make_request(ip)
      if MaxMind::Service.license_key.nil?
        raise LicenseError.new("License Key is missing")
      end

      uri = URI.parse(MaxMind::Service.base_url)

      begin
        self.response = Net::HTTP.get(uri.host, build_path(:l => MaxMind::Service.license_key, :i => ip), uri.port)
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
      raise RequestError.new("Cannot build a valid request path!") unless !self.class.base_path.nil? && params.is_a?(Hash)
      self.class.base_path + '?' + params.to_query_string
    end

    def valid_response?
      !response.nil? && !response.empty?
    end
  end
end