require 'rails_helper'

RSpec.describe "ImprovementRequests", type: :request do
  describe "GET /improvement_requests" do
    it "works! (now write some real specs)" do
      get improvement_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
