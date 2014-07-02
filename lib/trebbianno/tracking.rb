module Trebbianno
  class Tracking

    attr_accessor :carrier

    FEDEX = "http://printtracking.fedex.com/trackOrder.do?gtns=:tracking_number"
    USPS  = "https://tools.usps.com/go/TrackConfirmAction.action?tLabels=:tracking_number"
    UPS   = "http://wwwapps.ups.com/WebTracking/track?trackNums=123412341234&track.x=Track"

    def initialize(carrier, tracking_number)
      @carrier         = carrier
      @tracking_number = tracking_number
      url
    end

    def carrier_url
      self.class.const_get(carrier.upcase)
    end

    def url
      carrier_url.gsub(':tracking_number', @tracking_number)
    end

  end
end