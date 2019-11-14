require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "#index" do
    let(:articles) { create_list(:article, 3) }

    before { get :index }

    it "レスポンスが正しいこと" do
      aggregate_failures do
        expect(response).to have_http_status 200
        expect(response).to render_template :index
      end
    end

    it "正しいインスタンス変数がセットされていること" do
      aggregate_failures do
        expect(assigns(:articles)).to match_array(articles)
      end
    end
  end
end
