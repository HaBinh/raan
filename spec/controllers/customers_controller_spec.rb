require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
  describe 'GET index' do
    render_views
    fixtures :customers
    it 'returns correct types' do
      get :index, :format => :json
      expect_json_types(customers: :array)
      expect_json_types('customers.*', name: :string, email: :string, 
                                       phone: :string, addres: :string_or_null)
    end

    it 'return correct data' do 
      get :index, :format => :json
      expect_json('customers.0', { :id => 1, :name => "Thuan"})
      expect_status(200)
    end
  end

  describe 'GET show' do 
    fixtures :customers
    render_views 
    it 'returns correct types' do 
      get :show, params: { id: 1}, :format => :json
      expect_json_types('customer', name: :string, email: :string, 
                                       phone: :string, addres: :string_or_null)
      expect_status(200)
    end

    it 'returns correct data' do 
      get :show, params: { id: 1}, :format => :json
      expect_json('customer', { :id => 1, :name => 'Thuan'})
    end
  end

  describe 'POST create'  do 
    render_views 
    fixtures :customers 
    it 'return correct types' do
      body = { 'name' => 'thuan', :email => 'doan274@gmail.com', :phone => '01237546997'} 
      post :create, params: body, :format => :json
      expect_status(201)
      expect_json_types('customer', name: :string, email: :string, 
                                     phone: :string, addres: :string_or_null)
    end

    it 'return correct data' do 
      body = { 'name' => 'thuan', :email => 'doan274@gmail.com', :phone => '01237546997'} 
      post :create, params: body, :format => :json
      expect_json('customer', { :id => 4, :name => 'thuan'})
    end
  end
end
