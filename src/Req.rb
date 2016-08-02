require 'net/http'
require 'uri'

module Req

  class Get

    def initialize(url)
      get url
    end

    def get(url)
      uri = URI.parse(url)
      @http = Net::HTTP.new(url.host, uri.port)
      @request = Net::HTTP::Get.new(uri.to_s)
      return self
    end

    def body
      return @body
    end

    def headers(headers)
      headers.each do |key, val|
        @request[key] = val
      end
      return self
    end

    def asJson
      @request["Accept"] = "application/json"
      return self
    end

    def body
      return @response.body
    end

    def status_code
      return @response.code
    end

    def exec
      @response = http.request request
      return self
    end

  end

end