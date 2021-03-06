# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :development)
require 'rspec'
require 'webmock/rspec'
require 'hashie'
require 'trebbianno'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

def read_xml(type)
  File.read( File.expand_path("spec/fixtures/#{type}.xml") )
end

def fixture(type)
  XmlSimple.xml_in( read_xml(type) )
end

def test_line_items_string(order)
  [].tap do |arr|
    order[:line_items].each do |hash|
      arr << { price: hash[:price],
               quantity: hash[:quantity],
               sku: hash[:sku],
               size: hash[:size]}
     end
  end
end

def request_headers
  {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'text/xml', 'User-Agent'=>'Ruby'}
end

def inventory_request
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<stock>\n</stock>\n"
end

def order_hash
{
  carrier: "FEDEX",
  billing_address:  {
    first_name: "John",
    last_name:  "Smith",
    address1:   "123 Here Now",
    address2:   "2nd Floor",
    address3:   "",
    city:       "New York",
    state:      "NY",
    country:    "US",
    zipcode:    "10012",
    phone:      "123-123-1234"
  },
  shipping_address: {
    first_name: "John",
    last_name:  "Smith",
    address1:   "123 Here Now",
    address2:   "2nd Floor",
    address3:   "",
    city:       "New York",
    state:      "New York",
    country:    "US",
    zipcode:    "10012",
    phone:      "123-123-1234"
  },
  gift_wrap:    "true",
  gift_message: "Happy Birthday!",
  email:        "someone@somehwere.com",
  number:       "R123123123",
  type:         "OO",
  item_discount: -40,
  shipping_cost: 30,
  shipping_discount: 0,
  tax: 20,
  shipping_method: 'UPS AIR',
  date: '01-01-2016',
  line_items: [
    {
      price:    100,
      quantity: "2",
      sku:      "123332211",
      size:     "XS"
    },
    {
      price:    200,
      quantity: "1",
      sku:      "123332212",
      size:     "XS"
    }
  ],
  shipping_code: "90",
  invoice_url:   "http://example.com/R123123123/invoice"
}
end
