require "rails_helper"

RSpec.describe "Admin::Categories#index", type: :request do
  let(:admin) { create(:user, :admin) }
  # let(:user)  { create(:user) }
  let!(:category) { create(:category) }

  describe "GET /admin/categories" do
    context "when admin is logged in" do
      before do
        sign_in admin, scope: :user

        get admin_categories_path

      end

      it "returns http success" do
        expect(response).to have_http_status(:ok)
      end

      it "renders categories" do
        expect(response.body).to include("Books")
      end
    end

  end
end
