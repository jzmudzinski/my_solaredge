# frozen_string_literal: true

RSpec.describe MySolaredge do
  it "has a version number" do
    expect(MySolaredge::VERSION).not_to be nil
  end

  it "when new is called, returns a Client" do
    expect(MySolaredge.new("test")).to be_a_kind_of(MySolaredge::Client)
  end
end
