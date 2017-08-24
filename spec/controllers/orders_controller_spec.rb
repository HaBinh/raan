require 'rails_helper'

RSpec.describe 'Orders API', type: :request do

  let!(:customer) { create(:customer) }
  let(:customer_id) { customer.id } 

  let!(:article) { create(:article) }
  let(:article_id) { article.id }

  let(:quantity) { 5 }

  let(:valid_params) { { order: { customer_id: customer_id },
                         order_items: [
                            {
                              article_id: article_id, 
                              quantity: quantity 
                            }
                         ]} }

  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }         


  describe 'POST /orders' do
    before { 
      @before_order_count = Order.count
      @before_order_item  = OrderItem.count
      post "/orders", params: valid_params, headers: user_auth_headers 
    }

    it 'return status 200' do 
      expect_status 200
    end

    it 'should add complete ' do 
      expect(Order.count).not_to eq(@before_order_count)
      expect(OrderItem.count).not_to eq(@before_order_item)
    end
  end
end
