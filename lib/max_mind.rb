$:.unshift File.dirname(__FILE__)

require 'uri'
require 'cgi'
require 'net/http'
require 'yaml'
require 'csv'

class Hash
  def to_query_string
    self.to_a.collect { |p| "#{p.first.to_s}=#{p.last}" }.join("&")
  end
end

require 'max_mind/version'
require 'max_mind/service'
require 'max_mind/service/country'
require 'max_mind/service/city'
require 'max_mind/service/city_isp_org'

module MaxMind
  class LicenseError < StandardError; end
  class ConfigurationError < StandardError; end
  class ConnectionError < StandardError; end
  class RequestError < StandardError; end
  class ResponseError < StandardError; end
end
