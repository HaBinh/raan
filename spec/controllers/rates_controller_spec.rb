require 'rails_helper'

RSpec.describe RatesController,:type => :controller do

  let!(:rates) { create(:rate, 5) }
  let(:rate_id) { rates.first.id }

  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }
  byebug
  describe 'GET index' do
    render_views
    fixtures :rates  
    it 'returns correct types' do
      request.headers.merge! user_auth_headers
      get :index, :format => :json
      expect_json_types(rates: :array)
      expect_json_types('rates.*', rate: :float)
      
    end
    it 'return correct data' do 
      request.headers.merge! user_auth_headers
      get :index, :format => :json
      expect_json('products.0', { :id => rate_id, :rate => rate.rate })
      expect_status(200)
    end
  end 
end
