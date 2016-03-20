require 'rails_helper'

describe V1::TestsController do
  let!(:current_user){ User.make!(:confirmed) }

  describe "GET tests/step/:step" do
    context "With valid step" do
      it "Should return the question and results for step o dimension" do
        get "/tests/step/extraversion", {}, request_headers_for(current_user)
        expect(response.status).to eq(200)
        # expect(json).to eq({"question"=>"Your mind is always buzzing with unexplored ideas and plans.", "result"=>0})
      end
    end

    context "With invalid step" do
      it "Should return a message error" do
        get "/tests/step/invalid", {}, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json).to eq({"message"=>"invalid params"})
      end
    end
  end

  describe "GET tests/results" do
    context "With test complete" do
      it "Should return the results of test" do
        current_user.test_result.update_column(:complete, true)
        get "/tests/results", {}, request_headers_for(current_user)
        expect(response.status).to eq(200)
        expect(json).to have_key("image_name")
      end
    end

    context "With test incomplete" do
      it "Should return a message error" do
        get "/tests/results", {}, request_headers_for(current_user)
        expect(response.status).to eq(422)
        expect(json).to eq({"message"=>"No results yet."})
      end
    end
  end

  describe "PUT tests" do
    context "With valid params" do
      it "Should update the results of current_user" do
        put tests_path, { introversion: "3" }, request_headers_for(current_user)
        expect(response.status).to eq(200)
        current_user.test_result.reload
        expect(current_user.test_result.introversion).to eq(3)
        expect(json["introversion"]).to eq(3)
      end
    end
  end

end
