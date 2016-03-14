require 'rails_helper'

RSpec.describe AcademicExperience, type: :model do
  describe "Callbacks" do
    describe "find_or_create_city" do
      it "find or create a city and assign the name to attribute city of profile" do
        country = Country.make!
        expect {
          AcademicExperience.create(degree: "Engineer", institution: "UNET", start_date: "15-02-2010",
            end_date: "17-06-2012", country_code: country.cc_iso, city: "San Cristobal")
        }.to change(City, :count).by(1)
        expect(City.last.name).to eq("San Cristobal")
        expect(City.last.country).to eq(country)
      end
    end
  end
end
