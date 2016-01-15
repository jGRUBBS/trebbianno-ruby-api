require 'spec_helper'

describe Trebbianno::Order do

  before do
    @client       = Trebbianno::Client.new("the_username", "the_password")
    @order_client = Trebbianno::Order.new(@client)
    @xml          = Builder::XmlMarkup.new
  end

  describe '#build_order_request' do
    it 'should' do
      response = @order_client.build_order_request(order_hash)
      expect(response).to eq read_xml(:test_build_oreder_request)
    end
  end

  describe 'private#build_address' do
    before do
      @xml = ::Builder::XmlMarkup.new :indent => 3
      @xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
    end 
    it 'should build the proper address xml' do
      request = @order_client.send(:build_address, @xml, order_hash[:shipping_address])
      expect(request).to eq read_xml(:test_build_address)
    end
  end

  describe 'private#build_line_items' do
    it 'should build the proper line items xml' do
      request = @order_client.send(:build_line_items, @xml, order_hash)
      expect(request).to eq test_line_items_string(order_hash)
    end
  end

  describe 'private#freight_charge' do
    it 'should claculate freight charges for order' do
      charge = @order_client.send(:freight_charge, order_hash)
      expect(charge).to eq 30
    end
  end

  describe 'private#line_item_discount' do
    it 'should calculate discount price for line item' do
      discount_amount = @order_client.send(:line_item_discount, order_hash[:line_items].first[:price], order_hash)
      expect(discount_amount).to eq 50.89
    end
  end

end
