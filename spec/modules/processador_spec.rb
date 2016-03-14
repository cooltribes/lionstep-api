require 'rails_helper'

RSpec.describe "TestProcessador", type: :lib do

  let(:values) do
    values = {
      :extraversion => 3,
      :feeling => 1,
      :introversion => 3,
      :judging => -2,
      :intuition => 2,
      :perceiving => 2,
      :sensing => 2,
      :thinking => 1
    }
    OpenStruct.new(values)
  end

  describe "#type" do
    it "should return the type of results" do
      test = TestProcessador.new(values)
      expect(test.type).to eq("ENFP")
    end
  end

  describe "#results" do
    it "should return a hash with all data of results" do
      test = TestProcessador.new(values)
      expect(test.results).to have_key(:name)
    end
  end

  describe "#name" do
    it "should return a name of the results" do
      test = TestProcessador.new(values)
      expect(test.name).to eq("Tenaz")
    end
  end
end