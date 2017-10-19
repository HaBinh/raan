require 'rails_helper'

RSpec.describe 'Orders API', type: :request do

  # let!(:order) { create(:order) }
  # let(:order_id) { order.id }
  # let!(:order_item) { create(:order_item, order_id: order_id, quantity: 2) }

  let!(:customer) { create(:customer) }
  let(:customer_id) { customer.id } 

  let!(:product) { create(:product) }
  let(:product_id) { product.id }

  let!(:articles) { create_list(:article, 10, product_id: product_id)}
  let(:status) { 'exist' }
  let(:price_sale) { 2000 }
  let(:quantity) { 1 }
  let(:not_enough_quantity) { 1000 }
  let(:discounted_rate) { 0 }

  let(:attr_for_customer) { attributes_for(:customer) }

  let(:total_amount) { price_sale * quantity }
  let(:customer_paid_fully) { price_sale * quantity }
  let(:customer_NOT_fully_paid) { 1 }

  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token } 
  let(:payment) { 1 }        

  describe 'POST /orders' do

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

    let(:paid_am1) { { 
      order: { 
        customer_id: customer_id,  
        customer_paid: -1
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

  let(:quantity_less_than_0) { { 
    order: { 
      customer_id: customer_id,  
      customer_paid: 1
    },
    order_items: [
      {
        product_id: product_id,
        quantity: -1,
        price_sale: price_sale,
        discounted_rate: discounted_rate
      }
    ]
  } 
}

    let(:not_fully_paid_params) { { 
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

    let(:unvalid_params) { { 
        order: { 
          customer_id: customer_id,  
          customer_paid: customer_paid_fully
        },
        order_items: [
          {
            product_id: product_id,
            quantity: not_enough_quantity,
            price_sale: price_sale,
            discounted_rate: discounted_rate
          }
        ]
      } 
    }

    let(:new_customer_params) { {
      order: {
        name: 'Thuan', 
        phone: '01237546997',
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
    }}

    describe 'with customer paid < -1' do
      before { 
        post "/orders", params: paid_am1, headers: user_auth_headers 
      }
      
      it 'return status 422' do 
        expect_status 422
      end
  
      it 'return correct types' do 
        expect_json({ :message => "Customer paid should be greater than 0" })
      end
    end

    describe 'with quantity <= 0' do 
      before { 
        post "/orders", params: quantity_less_than_0, headers: user_auth_headers 
      }
      
      it 'return status 422' do 
        expect_status 422
      end
  
      it 'return correct types' do 
        expect_json({ :message => "Quantity should be greater than 0" })
      end
    end
    describe 'with valid params' do 
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

    describe 'with unvalid params ( not enough quantity )' do 
      before { 
        @before_order_count = Order.count
        @before_order_item  = OrderItem.count
        post "/orders", params: unvalid_params, headers: user_auth_headers 
      }

      it 'return status 422' do 
        expect_status 422
      end

      it 'return message show instruction not enough quantity' do 
        expect_json ( { message: 'Not enough quantity'})
      end

      it 'cannot create order' do 
        expect(Order.count).to eq(@before_order_count)
      end
    end

    describe 'with new customer' do 
      before {
        @before_customer_count
        post "/orders", params: new_customer_params, headers: user_auth_headers 
      }

      it 'Should create new customer' do 
        expect(Customer.count).not_to eq(@before_customer_count)
      end

      it 'return correct types' do 
        expect_json_types('order',
                                   total_amount: :float, 
                                   customer_paid: :float, 
                                   fully_paid: :boolean)
        expect_json('order', { :customer_id => customer_id + 1, 
                               :total_amount => price_sale * quantity,
                               fully_paid: true })
      end
  
      it 'should add complete ' do 
        expect(Order.count).not_to eq(@before_order_count)
        expect(OrderItem.count).not_to eq(@before_order_item)
      end
    end

    describe 'with not fully paid params' do 
      before {
        post "/orders", params: not_fully_paid_params, headers: user_auth_headers 
      }

      it 'should return correct types' do 
        expect_json_types('order',
        total_amount: :float, 
        customer_paid: :float, 
        fully_paid: :boolean)
      end

      it 'should returrn correct customer paid' do 
        expect_json('order', { customer_paid: customer_NOT_fully_paid,
                               fully_paid: false})
      end
    end

  end

  describe 'GET /orders' do 

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
    before { 
      post "/orders", params: valid_params, headers: user_auth_headers 
      get "/orders.json", params: {}, headers: user_auth_headers }

    it 'return status 200' do 
      expect_status 200 
    end

    it 'return correct types' do 
      expect_json_types(orders: :array_of_objects)
    end
  end

  describe 'GET /orders/:id' do 
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
    before { 
      post "/orders", params: valid_params, headers: user_auth_headers 
      order_id = Order.last.id
      get "/orders/#{order_id}.json", params: {}, headers: user_auth_headers
    }

    it 'return status 200' do 
      expect_status 200
    end

    it 'return order correct types' do 
      expect_json_types('order', total_amount: :float, 
                                 debt: :float,
                                 fully_paid: :boolean,
                                 customer: :object, 
                                 order_items: :array_of_objects)
    end

    it 'return correct data order' do 
      expect_json('order', total_amount: customer_paid_fully, 
                           fully_paid: true,
                           customer_paid: customer_paid_fully,
                           debt: 0)
    end

    it 'return correct customer data' do 
      expect_json('order.customer', name: customer.name, 
                                          phone: customer.phone)
    end

    it 'return correct customer types' do 
      expect_json_types('order.customer', name: :string, 
                                          phone: :string, 
                                          email: :string_or_null)
    end

    it 'correct types order items' do 
      expect_json('order.order_items.0', amount: customer_paid_fully,
                                               quantity: quantity,
                                               discounted_rate: discounted_rate)
    end

    it 'correct types order items' do 
      expect_json_types('order.order_items.*', amount: :float,
                                               quantity: :integer,
                                               discounted_rate: :float)
    end

    it 'correct types product in order items' do 
      expect_json_types('order.order_items.*.product', name: :string, 
                                                       code: :string,
                                                       default_imported_price: :float,
                                                       default_sale_price: :float)
    end
  end

  describe 'PUT /orders/:id ( pay debt )' do 
    let(:not_fully_paid_params) { { 
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
      order_id = Order.last.id 
      put "/orders/#{order_id}.json", params: { payment: payment }, headers: user_auth_headers 
    }

    it 'should return correct types' do 
      expect_json_types('order', customer_paid: :float, 
                                 total_amount: :float, 
                                 fully_paid: :boolean,
                                 debt: :float) 
    end

    it 'should returrn correct data' do 
      expect_json('order', customer_paid: customer_NOT_fully_paid + payment, 
                           debt: total_amount - customer_NOT_fully_paid - payment,
                           fully_paid: false, 
                           total_amount: total_amount)
    end
  end
end
