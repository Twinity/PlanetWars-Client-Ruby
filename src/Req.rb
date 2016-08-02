require 'net/http'
require 'uri'

module Req

  class Get

    def initialize(url)
      get url
    end

    def initialize
      return self
    end

    def get(url)
      uri = URI.parse(url)
      @http = Net::HTTP.new(uri.host, uri.port)
      @request = Net::HTTP::Get.new(uri.request_uri)
      return self
    end

    def headers(headers)
      headers.each do |key, val|
        @request[key] = val
      end
      return self
    end

    def as_json
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
      @response = @http.request @request
      return self
    end

  end

  class Post

    def initialize(url)
      post url
    end

    def initialize
      return self
    end

    def post(url)
      uri = URI.parse(url)
      @http = Net::HTTP.new(uri.host, uri.port)
      @request = Net::HTTP::Post.new(uri.request_uri)
      return self
    end

    def headers(headers)
      headers.each do |key, val|
        @request[key] = val
      end
      return self
    end

    def as_json
      @request["Content-type"] = "application/json"
      return self
    end

    def set_body(body)
      @request.body = body
      return self
    end

    def exec
      @response = @http.request @request
      return self
    end

    def body
      return @response.body
    end

    def status_code
      return @response.code
    end

  end

end