require 'rails_helper'

RSpec.describe 'Orders API', type: :request do

  let!(:order) { create(:order) }
  let(:order_id) { order.id }
  let!(:order_item) { create(:order_item, order_id: order_id, quantity: 2) }

  let!(:customer) { create(:customer) }
  let(:customer_id) { customer.id } 

  let!(:product) { create(:product) }
  let(:product_id) { product.id }

  let!(:articles) { create_list(:article, 10, product_id: product_id)}
  let(:status) { 'exist' }
  let(:price_sale) { 2000 }
  let(:quantity) { 1 }
  let(:discounted_rate) { 0 }

  let(:customer_paid_fully) { price_sale * quantity }

  let(:valid_params) { { 
                          order: { 
                            customer_id: customer_id,  
                            customer_paid: customer_paid_fully
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

  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }         


  describe 'POST /orders' do
    before { 
      @before_order_count = Order.count
      @before_order_item  = OrderItem.count
      post "/orders", params: valid_params, headers: user_auth_headers 
    }
    
    it 'return status 201' do 
      expect_status 201
    end

    it 'return correct types' do 
      expect_json_types('order',
                                 total_amount: :float, 
                                 customer_paid: :float, 
                                 fully_paid: :boolean)
      expect_json('order', { :customer_id => customer_id, 
                             :total_amount => price_sale * quantity,
                             fully_paid: true })
    end

    it 'should add complete ' do 
      expect(Order.count).not_to eq(@before_order_count)
      expect(OrderItem.count).not_to eq(@before_order_item)
    end
  end

  describe 'DELETE /orders/:id' do 
    before { delete "/orders/#{order_id}", params: {}, headers: user_auth_headers }

    it 'should delete' do 
      expect(Order.count).not_to eq(@before_order_count)
    end

    it 'return status 200' do 
      expect_status 200
    end
  end

  describe 'GET /orders' do 
    before { get "/orders.json", params: {}, headers: user_auth_headers }

    it 'return status 200' do 
      expect_status 200 
    end

    it 'return correct types' do 
      expect_json_types(orders: :array_of_objects)
    end
  end

  describe 'GET /orders/:id' do 
    before { 
      get "/orders/#{order_id}.json", params: {}, headers: user_auth_headers
    }

    it 'return status 200' do 
      expect_status 200
    end

    it 'return correct types' do 
      expect_json_types('order', total_amount: :float, customer: :object, 
                                 order_items: :array_of_objects)

      expect_json_types('order.customer', name: :string, email: :string, phone: :string,
                                          address: :string_or_null)
      expect_json_types('order.order_items.*', status: :string, product: :object)
    end
  end
end
