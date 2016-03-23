require 'rails_helper'

RSpec.describe Contacts::SaveInBatch, type: :service do
  let!(:current_user){ User.make!(:confirmed) }
  let(:valid_params){
    [
      { info: "fcoarmandomendoza@gmail.com", contact_type: 0, privacy: 0 },
      { info: "+0562763535340", contact_type: 1, privacy: 0 },
      { info: "www.armandomendoza.com", contact_type: 7, privacy: 0 },

    ]
  }

  let(:invalid_params){
    [
      { info: "", contact_type: 90, privacy: 0 },
      { info: "+0562763535340", contact_type: 100, privacy: 0 },
      { info: "www.armandomendoza.com", contact_type: 7, privacy: 0 },

    ]
  }

  describe "#call" do
    context "With valid params" do
      it "Should return true and create a contacts from array of attributes for the given contactable" do
        expect {
          Contacts::SaveInBatch.new(current_user, valid_params).call
        }.to change(Contact, :count).by(3)
        expect(Contact.last.contactable).to eq(current_user)
      end
    end

    context "With invalid params" do
      it "Should return false and an array of errors for each contact" do
        contacts = Contacts::SaveInBatch.new(current_user, invalid_params)
        expect(contacts.call).to be false
        expect(contacts.errors.count).to eq(2)
        expect(contacts.errors.first[:info]).to eq(I18n.t("errors.messages.blank"))
      end
    end
  end
end
