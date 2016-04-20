require 'rails_helper'

describe V1::Admin::CompaniesController do
  let!(:current_user){ User.make!(:confirmed) }
  let!(:admin){ Admin.make!(:confirmed) }
  let(:company){ Company.make! }
  let(:valid_params) {
    {
      name: "Cooltribes"
    }
  }

  let(:invalid_params) {
    {
      name: ""
    }
  }

  describe "GET /admin/companies" do
    it "return all companies if user login as admin" do
      company
      get admin_companies_path, {}, request_admin_headers_for(admin)
      expect(response.status).to eq(200)
      expect(json["data"].count).to eq(1)
      # expect(json).to eq("")
    end
  end

  describe "GET /admin/companies/:id" do
    it "return all the info of the company" do
      get admin_company_path(company), {}, request_admin_headers_for(admin)
      expect(response.status).to eq(200)
      expect(json["data"]["attributes"]["name"]).to eq(company.name)
      # expect(json).to eq("")
    end
  end

  describe "POST admin/companies" do
    context "With valid params" do
      it "Should create a new company" do
        post admin_companies_path, valid_params, request_admin_headers_for(admin)
        expect(response.status).to eq(201)
        expect(json_attribute("name")).to eq("Cooltribes")
      end
    end

    context "With invalid params" do
      it "Should return a json with errors" do
        post admin_companies_path, invalid_params, request_admin_headers_for(admin)
        expect(response.status).to eq(422)
        expect(json["name"]).to eq([I18n.t("errors.messages.blank")])
      end
    end
  end

  describe "PUT admin/companies/:id" do
    it "Should update the company" do
      put admin_company_path(company), { name: "Upsidecorp"}, request_admin_headers_for(admin)
      expect(response.status).to eq(200)
      expect(json_attribute("name")).to eq("Upsidecorp")
    end
  end

  describe "DELETE admin/companies/:id" do
    it "Should delete a company of current user" do
      company
      expect {
        delete admin_company_path(company), {}, request_admin_headers_for(admin)
      }.to change(Company, :count).by(-1)
    end
  end
end
