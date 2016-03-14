require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "Callbacks" do
    describe "find_or_create_city" do
      it "find or create a city and assign the name to attribute city of profile" do
        country = Country.make!
        expect {
          Profile.create(first_name: "Armando", country_code: country.cc_iso, city: "San Cristobal")
        }.to change(City, :count).by(1)
        expect(City.last.name).to eq("San Cristobal")
      end
    end
  end
end
