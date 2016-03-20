require 'rails_helper'

describe V1::SectorsController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /sectors" do
    it "return all sectors" do
      3.times {|x| Sector.create!(name: "Sector-#{x}")}
      get "/sectors", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json).to eq([
        {"id"=>1, "name"=>"Sector-0"}, {"id"=>2, "name"=>"Sector-1"}, {"id"=>3, "name"=>"Sector-2"}
      ])
    end
  end

end
