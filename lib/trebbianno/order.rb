module Trebbianno
  class Order < Request

    PATH = "/Order"

    def build_order_request(order)
      construct_xml "orders" do |xml|

        xml.order do
          
          build_user xml

          address = order[:shipping_address]
          xml.name            "#{address[:first_name]} #{address[:last_name]}"
          build_address xml, address
          xml.customerref     order[:number]
          xml.orderdate       order[:date]
          xml.freightcharge   order[:shipping_cost]
          xml.ordernumber     order[:number]
          xml.shipping_method order[:shipping_method]
          xml.tax             order[:tax]

          build_line_items xml, order

        end

      end
    end

    private

    def build_address(xml, address)
      xml.addressline1 address[:address1]
      xml.addressline2 address[:address2]
      xml.towncity     address[:city]
      xml.state        State.map(address[:state])
      xml.postcode     address[:zipcode]
      xml.country      Country.map(address[:country])
      xml.contactphone address[:phone]
    end

    def build_line_items(xml, order)
      order[:line_items].each do |line_item|
        xml.orderline do
          xml.ordernumber order[:number]
          xml.sku         line_item[:sku]
          xml.qty         line_item[:quantity]
          xml.unitprice   line_item[:price]
        end
      end
    end

  end
end
