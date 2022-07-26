# frozen_string_literal: true

RSpec.describe MySolaredge::Client do
  subject { MySolaredge::Client.new(nil) }
  it "dynamically creates expected methods" do
    MySolaredge::Client::IMPLEMENTED_ENDPOINTS.each do |method|
      expect(subject.methods).to include(method)
    end
  end

  context "A request to the sites endpoint" do
    before do
      allow(subject).to receive(:credentials) { double(api_key: 'test') }
      allow(MySolaredge::Request::Sites).to receive(:get) { { "sites" => {} } }
    end

    it "returns the correct response class" do
      expect(subject.sites).to be_a(MySolaredge::Response::Sites)
    end
  end
end
