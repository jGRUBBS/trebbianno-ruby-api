require 'spec_helper'

describe Trebbianno::Client do
    let(:client) { Trebbianno::Client.new("the_username", "the_password") }

  describe '#send_order_request' do
    it 'should send order request and return parsed respose' do
      Trebbianno::Order.any_instance.should_receive(:build_order_request).with(order_hash)
      expect(client).to receive(:post)
      client.send_order_request(order_hash)
    end
  end

  describe '#get_inventory' do

    let(:expected_result) do
      [
        {"upc"=>"840258104705", "qty"=>"4"},
        {"upc"=>"840258104712", "qty"=>"17"},
        {"upc"=>"840258104729", "qty"=>"17"},
        {"upc"=>"840258101001", "qty"=>"4"},
        {"upc"=>"840258101002", "qty"=>"17"},
        {"upc"=>"840258101003", "qty"=>"17"}
      ]
    end

    let(:inventory_one) { read_xml(:inventory_fixture_1) }
    let(:inventory_two) { read_xml(:inventory_fixture_2) }

    before do
      stub_request(:post, "http://the_username:the_password@54.235.241.72:4081/Inventory").
        with(body: inventory_request, headers: request_headers).
        to_return(status: 200, body: inventory_one, headers: {})
      stub_request(:post, "http://the_username:the_password@54.235.241.72:4082/Inventory").
        with(body: inventory_request, headers: request_headers).
        to_return(status: 200, body: inventory_two, headers: {})
    end

    it 'should send inventory to client', focus: true do
      expect(client.get_inventory).to eq(expected_result)
    end
  end

  describe 'private#default_options' do
    it 'should return a hash' do
      expect(client.send(:default_options)).to be_a Hash
    end
  end

  describe 'private#testing?' do
    it 'should return boolean for test mode' do
      expect(client.send(:testing?)).to eq false

      client.instance_variable_set(:@options, { test_mode: true })
      expect(client.send(:testing?)).to eq  true
    end
  end

  describe 'private#verbose?' do
    it 'should return boolean for verbose mode' do
      expect(client.send(:verbose?)).to eq true

      client.instance_variable_set(:@options, { verbose: false })
      expect(client.send(:verbose?)).to eq  false
    end
  end

  describe 'private#host' do
    it 'should' do
      client.stub(:testing?).and_return(false)
      expect(client.send(:host)).to eq Trebbianno::Client::LIVE_HOST
      client.stub(:testing?).and_return(true)
      expect(client.send(:host)).to eq Trebbianno::Client::TEST_HOST
    end
  end


  describe 'private#log' do
    context 'not in verbose mode' do
      it 'should not log message' do
        client.stub(:verbose?).and_return(false)
        expect(client).not_to receive(:puts)
        client.send(:log, "message")
      end
    end
    context 'in verbose mode' do
      it 'should' do
        client.stub(:verbose?).and_return(true)
        expect(client).to receive(:puts).with("message")
        client.send(:log, "message")
      end
    end
  end
end
