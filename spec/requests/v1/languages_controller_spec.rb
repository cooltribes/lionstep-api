require 'rails_helper'

describe V1::LanguagesController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET /languages" do
    it "return all languages" do
      2.times {|x| Language.create!(name: "language-#{x}-en", locale: "en")}
      2.times {|x| Language.create!(name: "language-#{x}-es", locale: "es")}
      I18n.locale = "es"
      get "/languages", {}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json.first["name"]).to eq("language-0-es")
    end
  end

end
