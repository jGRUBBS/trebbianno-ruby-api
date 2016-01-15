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
          xml.freightcharge   freight_charge(order)
          xml.ordernumber     order[:number]
          xml.shipping_method order[:shipping_method]
          xml.tax             order[:tax]
          build_line_items xml, order

        end

      end

    end

    private

    def freight_charge(order)
      order[:shipping_cost] - order[:shipping_discount].abs
    end

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
          xml.unitprice   (line_item[:price] - line_item_discount(line_item[:price], order))
        end
      end
    end

    def line_item_discount(item_price, order)
      (item_price * order[:item_discount].to_f / 100).round(2)
    end

  end
end
