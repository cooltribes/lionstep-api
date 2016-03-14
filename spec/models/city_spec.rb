require 'rails_helper'

RSpec.describe City, type: :model do
  describe ".find_or_create" do
    it "create a city or return one" do
      country = Country.make!
      city = country.cities.last
      returned_city = City.find_or_create(name: city.name, cc_iso: country.cc_iso)
      expect(returned_city).to eq(city)
      returned_city = City.find_or_create(name: "San cristobal ", cc_iso: country.cc_iso)
      expect(returned_city.name).to eq("San Cristobal")
    end
  end
end
