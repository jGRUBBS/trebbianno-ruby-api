module Trebbianno
  class Order < Request

    PATH = "/Order"

    def build_order_request(order)
      construct_xml "order" do |xml|

        address = order[:shipping_address]
        xml.ordernumber     order[:number]
        xml.name            "#{address[:first_name]} #{address[:last_name]}"
        xml.customerref     order[:number]
        xml.freightcharge   order[:shipping_cost]
        xml.shipping_method order[:shipping_method]

        build_address xml, address
        build_line_items xml, order

      end
    end

    private

    def build_address(xml, address)
      xml.addressline1 address[:address1]
      xml.addressline2 address[:address2]
      xml.towncity     address[:city]
      xml.postcode     address[:zipcode]
      xml.country      address[:country]
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
