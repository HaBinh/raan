require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
  describe 'GET index' do
    render_views
    fixtures :customers
    it 'returns correct types' do
      get :index, :format => :json
      expect_json_types(customers: :array)
      expect_json('customers.0', { :id => 1, :name => "Thuan"})
      expect_status(200)
    end
  end
end