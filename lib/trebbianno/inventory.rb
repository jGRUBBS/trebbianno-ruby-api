module Trebbianno
  class Inventory < Request

    PATH = "/Inventory"

    def build_inventory_request
      construct_xml "stock"
    end

  end
end
