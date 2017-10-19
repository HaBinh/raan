require 'rails_helper'

RSpec.describe RatesController, :type => :controller do
  let!(:rate) { DiscountedRate.create(rate: 0.1) }
  let(:rate_id) { rate.id }

  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }
  
  describe "GET #index" do
    render_views
    fixtures :rates
    it 'returns correct types' do
      request.headers.merge! user_auth_headers
      get :index, :format => :json
      
      expect_json_types(rate: :json)

      byebug
      # expect_json_types('rate.*', rate: :float)
      # expect_json_types( rate.rate: :float)
      
    end

    it 'return correct data' do 
      request.headers.merge! user_auth_headers
      get :index, :format => :json
      # expect_json('rate', { :id => rate_id})
      expect_status(200)
    end
  end

end
