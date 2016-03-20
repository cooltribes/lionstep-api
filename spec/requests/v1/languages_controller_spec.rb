require 'rails_helper'

describe V1::LanguagesController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /languages" do
    it "return all languages" do
      3.times {|x| Language.create!(name: "language-#{x}")}
      get "/languages", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json).to eq([
        {"id"=>1, "name"=>"language-0"}, {"id"=>2, "name"=>"language-1"}, {"id"=>3, "name"=>"language-2"}
      ])
    end
  end

end
