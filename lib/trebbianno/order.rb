module Trebbianno
  class Order < Request

    def build_order_request(order)
      construct_xml "order" do |xml|

        # NOTES:
        # => need to move user and password outside of order
        # => do you need ordernumber on every orderline?

        address = order[:shipping_address]
        xml.name            "#{address[:first_name]} #{address[:last_name]}"
        xml.customerref     "" # FIXME: not sure what to put here
        xml.freightcharge   "" # FIXME: not sure what to put here
        xml.ordernumber     "#{order[:number]}"
        xml.shipping_method order[:shipping_method]

        build_address xml, order
        build_line_items xml, order

      end
    end

    private

    def build_address(xml, type, address)
      xml.addressline1 address[:address1]
      xml.addressline2 address[:address2]
      xml.towncity     address[:city]
      xml.postcode     address[:zipcode]
      xml.country      address[:country]
      xml.contactphone address[:phone]
    end

    def build_line_items(xml, order)
      xml.orderline
        xml.ordernumber
        xml.sku
        xml.qty
        xml.unitprice
      end
    end

  end
end
