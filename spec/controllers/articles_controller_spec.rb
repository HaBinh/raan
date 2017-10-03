require 'rails_helper'

RSpec.describe 'Acticles API', type: :request do
  
  let!(:article) { create(:article) }
  let(:article_id) { article.id }

  let!(:product) { create(:product) }
  let(:product_id) { product.id } 
  
  let(:status) { 'exist' }
  let(:price_sale) { 1000 }
  
  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }
  
  let(:valid_params) {
    {
        status: status,
        imported_price: price_sale,
        product_id: product_id,
        quantity: 4
    }
  }

    describe 'POST /articles' do
      before { 
        post "/articles", params: valid_params, headers: user_auth_headers 
      }
  
      it 'return status 201' do 
        expect_status 201
      end
    end
  
    describe 'DELETE /articles/:id' do 
      before { delete "/articles/#{article_id}", params: {}, headers: user_auth_headers }
  
      it 'should delete' do 
        expect(Article.count).not_to eq(@before_article_count)
      end
  
      it 'return status 200' do 
        expect_status 200
      end
    end
  
    describe 'GET /articles' do 
      before { get "/orders.json", params: {}, headers: user_auth_headers }
  
      it 'return status 200' do 
        expect_status 200 
      end

    end
  
    describe 'GET /articles/:id' do 
      before { 
        get "/articles/#{article_id}.json", params: {}, headers: user_auth_headers
      }
  
      it 'return status 200' do 
        expect_status 200
      end
  
      it 'return correct types' do 
        expect_json_types('article', status: :string, imported_price: :float,product_id: :integer,name: :string, code: :string, default_imported_price: :float,
        default_sale_price: :float )
      end
    end
end
