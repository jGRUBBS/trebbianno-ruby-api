require 'net/http'
require 'xmlsimple'

module Trebbianno
  class Client

    TEST_HOST = "54.235.241.72"
    LIVE_HOST = "54.235.241.72"

    attr_accessor :username, :password, :response, :type

    def initialize(username, password, options = {})
      raise "Username is required" unless username
      raise "Password is required" unless password

      @username = username
      @password = password
      @options  = default_options.merge!(options)
    end

    def send_order_request(order)
      request  = Order.new(self).build_order_request(order)
      response = post(request)
    end

    def get_inventory
      request = Inventory.new(self).build_inventory_request
      post(Inventory::PATH, request).response['stock']
    end

    private
    def default_options
      { 
        verbose: true,
        test_mode: false
      }
    end

    def testing?
      @options[:test_mode]
    end

    def verbose?
      @options[:verbose]
    end

    def host
      testing? ? TEST_HOST : LIVE_HOST 
    end

    def log(message)
      return unless verbose?
      puts message
    end

    def http
      Net::HTTP.new(host, 4081)
    end

    def request(path, xml_request)
      request          = Net::HTTP::Post.new(path)
      req.body         = xml_request
      req.content_type = 'text/xml'
      request.basic_auth(@username, @password)
      http.request(request)
    end

    def post(path, xml_request)
      response = request(path, xml_request)
      parse_response(response.body)
    end

    def parse_response(xml_response)
      log(xml_response)
      @response = Response.new(xml_response, @type)
    end

  end
end
