
require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  let!(:product) { create(:product) }
  let(:product_id) { product.id }

  describe 'GET index' do
    render_views
    fixtures :products
    it 'returns correct types' do
      get :index, :format => :json
      expect_json_types(products: :array)
      expect_json_types('products.*', name: :string, code: :string, 
                                       categori: :string, price_sale: :float)
    end

    it 'return correct data' do 
      get :index, :format => :json
      expect_json('products.0', { :id => product_id, :name => product.name })
      expect_status(200)
    end
  end

  describe 'GET show' do 
    fixtures :products
    render_views 
    it 'returns correct types' do 
      get :show, params: { id: product_id}, :format => :json
      expect_json_types('product',  name: :string, code: :string, 
                                       categori: :string, price_sale: :float)
      expect_status(200)
    end

    it 'returns correct data' do 
      get :show, params: { id: product_id}, :format => :json
      expect_json('product', { :id => product_id, :name => product.name })
    end
  end

  describe 'POST create'  do 
    render_views 
    fixtures :products 
    it 'return correct types' do
      body = { 'name' => 'iphone', :code => '123456789', :categori => 'red', :price_sale => '1000'} 
      post :create, params: body, :format => :json
      expect_status(201)
      expect_json_types('product', name: :string, code: :string, 
                                       categori: :string, price_sale: :float)
    end
  end
end

RSpec.describe 'Products API', type: :request do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  describe 'GET /products/:id ' do 
    before { get "/products/#{product_id}.json" }

    context 'when the record not exists ' do
      let(:product_id) { 100 }

      it 'returns status code 404' do
        expect_status 404
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Not found/)
      end
    end
  end

  describe 'PUT /products/:id ' do
    let(:valid_attributes) { { name: 'iphone' }}

    context 'when the record exists' do 
      before { put "/products/#{product_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'return status code 200' do 
        expect_status 200
      end
    end
  end

  describe 'DELETE /products/:id' do
    before { delete "/products/#{product_id}" }

    it 'return status code 200' do 
      expect_status 200
    end
  end


end

