require 'rails_helper'

describe V1::Users::LanguagesController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:language){ Language.make! }
  let(:valid_params) do {languages: [
    { language_id: language.id, level: 5 }
  ]}
  end

  describe 'POST /languages' do
    context "With valid params" do
      it "Should add the languages to current user" do
        post user_languages_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json["data"][0]["attributes"]["name"]).to eq(language.name)
      end
    end

    context "With invalid params" do
      pending
    end
  end

  describe "DELETE /languages/:id" do
    before { current_user.language_levels << LanguageLevel.create(language: language, level: 4) }
    it "Should delete a languages from current user" do
      expect {
        delete user_language_path(current_user, language), {}, request_headers_for(current_user)
      }.to change(current_user.languages, :count).by(-1)
      expect(Language.count).to eq(1)
    end
  end
end
