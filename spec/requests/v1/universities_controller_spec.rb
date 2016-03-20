require 'rails_helper'

describe V1::UniversitiesController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /universities" do
    it "return all universities" do
      3.times {|x| University.create!(name: "University-#{x}")}
      get "/universities", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json).to eq([
        {"id"=>1, "name"=>"University-0"}, {"id"=>2, "name"=>"University-1"}, {"id"=>3, "name"=>"University-2"}
      ])
    end
  end

end
