require 'rails_helper'

RSpec.describe "AccountSettings", type: :request do
  describe "GET /account_settings" do
    it "works! (now write some real specs)" do
      get account_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
