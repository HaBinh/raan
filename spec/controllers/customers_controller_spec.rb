require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

  let!(:customer) { create(:customer) }
  let(:customer_id) { customer.id }
  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }

  describe 'GET index' do
    render_views
    fixtures :customers
    it 'returns correct types' do
      request.headers.merge! user_auth_headers
      get :index, params: {}, :format => :json
      expect_json_types(customers: :array)
      expect_json_types('customers.*', name: :string, email: :string, 
                                       phone: :string, addres: :string_or_null)
    end

    it 'return correct data' do 
      request.headers.merge! user_auth_headers
      get :index, :format => :json
      expect_json('customers.0', { :id => customer_id, :name => customer.name })
      expect_status(200)
    end
  end

  describe 'POST create'  do 
    render_views 
    fixtures :customers 
    it 'return correct types' do
      request.headers.merge! user_auth_headers
      body = { 'name' => 'thuan', :email => 'doan274@gmail.com', :phone => '01237546997'} 
      post :create, params: body, :format => :json
      expect_status(201)
      expect_json_types('customer', name: :string, email: :string, 
                                     phone: :string, addres: :string_or_null)
    end
  end

  describe 'GET show' do 
    fixtures :customers
    render_views 
    it 'returns correct types' do 
      request.headers.merge! user_auth_headers
      get :show, params: { id: customer_id}, :format => :json
      expect_json_types('customer', name: :string, email: :string, 
                                       phone: :string, addres: :string_or_null)
      expect_status(200)
    end

    it 'returns correct data' do 
      request.headers.merge! user_auth_headers
      get :show, params: { id: customer_id}, :format => :json
      expect_json('customer', { :id => customer_id, :name => customer.name })
    end
  end
  
  
end

RSpec.describe 'Customers API', type: :request do
  let!(:customers) { create_list(:customer, 10) }
  let(:customer_id) { customers.first.id }
  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }

  describe 'GET /customers' do
    before { 
      post "/customers.json", params: {}, headers: user_auth_headers 
    }

    it 'return status 422' do 
      expect_status 422
    end
  end

  describe 'GET /customers/:id ' do 
    before { 
      get "/customers/#{customer_id}.json", params: {}, headers: user_auth_headers
    }

    context 'when the record not exists ' do
      let(:customer_id) { 100 }

      it 'returns status code 404' do
        expect_status 404
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Not found/)
      end
    end
  end

  describe 'PUT /customers/:id ' do
    let(:valid_attributes) { { name: 'Thuan' }}

    context 'when the record exists' do 
      before { 
        put "/customers/#{customer_id}", params: valid_attributes, headers: user_auth_headers 
      }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'return status code 200' do 
        expect_status 200
      end
    end
  end

  describe 'DELETE /customers/:id' do
    
    before { 
      delete "/customers/#{customer_id}", params: {}, headers: user_auth_headers 
    }
    it 'returns a not found message' do
      expect(response.body).to match(//)
    end

    it 'return status code 200' do 
      expect_status 200
    end
  end

  describe 'GET /customers_in_debt.json' do
    let(:customer_NOT_fully_paid) { 1 }
    let!(:product) { create(:product) }
    let(:product_id) { product.id }
    let(:price_sale) { 2000 }
    let(:quantity) { 1 }
    let(:discounted_rate) { 0 }
    let!(:not_fully_paid_params) { { 
      order: { 
        customer_id: customer_id,  
        customer_paid: customer_NOT_fully_paid
      },
      order_items: [
        {
          product_id: product_id,
          quantity: quantity,
          price_sale: price_sale,
          discounted_rate: discounted_rate
        }
      ]
      } 
    }

    before {
      post "/orders", params: not_fully_paid_params, headers: user_auth_headers 
      # order_id = Order.last.id
      get "/customers_in_debt.json", params: {}, headers: user_auth_headers
      # byebug
    }

    it 'return status 200' do 
      expect_status 200
    end

    it 'returns response' do
      expect(response.body).to match(/customers/)
    end

  end
end
