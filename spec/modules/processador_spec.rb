require 'rails_helper'

RSpec.describe "TestProcessador", type: :lib do

  let(:values) do
    values = {
      :extraversion => 3,
      :feeling => 3,
      :introversion => 1,
      :judging => 3,
      :intuition => 3,
      :perceiving => 2,
      :sensing => 1,
      :thinking => 1
    }
    OpenStruct.new(values)
  end

  describe "#type" do
    it "should return the type of results" do
      test = TestProcessador.new(values)
      expect(test.type).to eq("ENFJ")
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
      expect(test.name).to eq("Protagonista")
    end
  end
end