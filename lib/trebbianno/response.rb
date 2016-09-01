module Trebbianno
  class Response

    attr_accessor :response

    def initialize(raw_response, type)
      @raw_response = raw_response
      @response     = parse_response(raw_response)
      @type         = type
    end

    def failure?
      !success?
    end

    def success?
      # @response.parsed["#{@type}_response"]["#{@type}_result"][:status] == '0001'
      true
    end

    def parse_response(xml_response)
      blank = xml_response.respond_to?(:empty?) ? !!xml_response.empty? : !xml_response
      return nil if blank
      XmlSimple.xml_in(xml_response)
    end

  end
end
