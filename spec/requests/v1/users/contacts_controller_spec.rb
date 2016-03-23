require 'rails_helper'

describe V1::Users::ContactsController do
  let!(:current_user){ User.make!(:confirmed) }
  let(:contact){ Contact.make!(:email, contactable: current_user) }

  let(:valid_params) do
    { info: "@FcoArmando", contact_type: 2, privacy: 1 }
  end

  let(:invalid_params) do
    { info: "@FcoArmando", contact_type: 200, privacy: 1 }
  end

  describe "POST /contacts" do
    context "With valid params" do
      it "Should create a new contact for current user" do
        post user_contacts_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(201)
        expect(json_attribute("info")).to eq("@FcoArmando")
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        post user_contacts_path(current_user), invalid_params, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json["errors"]["contact_type"]).to eq([I18n.t("errors.messages.inclusion")])
      end
    end
  end

  describe "POST /contacts/batch" do
    context "With valid params" do
      it "Should create a new contact for current user" do
        valid_params = { contacts: [
          { info: "@FcoArmando", contact_type: 2, privacy: 1 },
          { info: "fcoarmandomendoza@gmail", contact_type: 1, privacy: 1 }
        ]}
        post batch_user_contacts_path(current_user), valid_params, request_headers_for(current_user)
        expect(response.status).to eq(200)
        expect(json["data"].first["attributes"]["info"]).to eq("fcoarmandomendoza@gmail")
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        invalid_params = { contacts: [
          { info: "@FcoArmando", contact_type: 20, privacy: 1 },
          { info: "fcoarmandomendoza@gmail", contact_type: 1, privacy: 1 }
        ]}
        post batch_user_contacts_path(current_user), invalid_params, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json[0]["index"]).to eq(0)
        expect(json[0]["contact_type"]).to eq(I18n.t("errors.messages.inclusion"))
      end
    end
  end

  describe "PUT /contacts/:id" do
    it "Should update the contact" do
      put user_contact_path(current_user, contact), { info: "fcoarmandomendoza@gmail.com"}, request_headers_for(current_user)
      expect(response.status).to eq(200)
      expect(json_attribute("info")).to eq("fcoarmandomendoza@gmail.com")
    end
  end

  describe "DELETE /contacts/:id" do
    it "Should delete a contact of current user" do
      contact
      expect {
        delete user_contact_path(current_user, contact), {}, request_headers_for(current_user)
      }.to change(current_user.contacts, :count).by(-1)
    end
  end

  # describe "Policies" do
  #   it "should apply the Pundit policies" do
  #     other_user = User.make!(:confirmed)
  #     contact = Contact.make!(:email, contactable: other_user)
  #     delete user_contact_path(current_user, contact), {}, request_headers_for(current_user)
  #     expect(response.status).to eq(200)
  #   end
  # end

end
