require 'rails_helper'

RSpec.describe Registration::AddLanguagesToUser, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let!(:english){ Language.make!(name: "English")}
  let!(:spanish){ Language.make!(name: "Spanish")}
  let(:languages_params){[
    { language_id: english.id, level: 5 },
    { language_id: spanish.id, level: 2 }
  ]}

  describe "#call" do
    it "should add languages to user" do
      service = Languages::AddLanguagesToUser.new(current_user, languages_params)
      expect{
        service.call
      }.to change(current_user.languages, :count).by(2)
      expect(current_user.language_levels.first.level).to eq(5)
    end
  end

end