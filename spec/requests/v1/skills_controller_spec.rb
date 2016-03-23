require 'rails_helper'

describe V1::SkillsController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /skills" do
    it "return all skills filter by locale" do
      2.times {|x| Skill.create!(name: "Sector-#{x}-en", locale: "en")}
      2.times {|x| Skill.create!(name: "Sector-#{x}-es", locale: "es")}
      I18n.locale = "es"
      get "/skills", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("Sector-0-es")
    end
  end

end
