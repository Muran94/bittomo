require 'rails_helper'

RSpec.describe InquiriesController, type: :controller do

  describe "#new" do
    before { get :new }

    it "レスポンスが正しいこと" do
      aggregate_failures do
        expect(response).to have_http_status 200
        expect(response).to render_template :new
      end
    end

    it "正しいインスタンス変数がセットされていること" do
      aggregate_failures do
        expect(assigns(:inquiry)).to be_a_new(Inquiry)
      end
    end
  end

  describe "#create" do
    context "ユーザーがログイン済みの場合" do
      it "UserIDがセットされていること" do

      end
    end

    context "ユーザーがログイン済みでない場合" do
      it "UserIDがセットされていないこと" do

      end
    end
  end
end
