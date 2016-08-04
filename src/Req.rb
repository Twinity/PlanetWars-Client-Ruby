require 'net/http'
require 'uri'

module Req

  class Get

    def initialize(*args)
      if args.length == 1
        get url
      end
      self
    end

    def get(url)
      uri = URI.parse(url)
      @http = Net::HTTP.new(uri.host, uri.port)
      @request = Net::HTTP::Get.new(uri.request_uri)
      self
    end

    def headers(headers)
      headers.each do |key, val|
        @request[key] = val
      end
      self
    end

    def as_json
      @request["Accept"] = "application/json"
      self
    end

    def body
      @response.body
    end

    def status_code
      @response.code
    end

    def exec
      @response = @http.request @request
      self
    end

  end

  class Post

    def initialize(*args)
      if args.length == 1
        post url
      end
      self
    end

    def post(url)
      uri = URI.parse(url)
      @http = Net::HTTP.new(uri.host, uri.port)
      @request = Net::HTTP::Post.new(uri.request_uri)
      self
    end

    def headers(headers)
      headers.each do |key, val|
        @request[key] = val
      end
      self
    end

    def as_json
      @request["Content-type"] = "application/json"
      self
    end

    def set_body(body)
      @request.body = body
      self
    end

    def exec
      @response = @http.request @request
      self
    end

    def body
      @response.body
    end

    def status_code
      @response.code
    end

  end

end