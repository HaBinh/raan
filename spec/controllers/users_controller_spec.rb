require 'rails_helper'

RSpec.describe 'User API', type: :request do
    let(:admin) { create(:user, :role => "manager") }
    let(:admin_auth_headers) { admin.create_new_auth_token } 

    let(:user) { create(:user) }
    let(:user_auth_headers) { user.create_new_auth_token } 

    describe 'get all users' do
        context 'not manager' do 
            before { 
                get '/api/users', params: {}, headers: user_auth_headers
            }

            it 'should not process status' do 
                expect_status 422
            end

            it 'should render right message' do 
                expect_json('message', "You are not manager")
            end
        end 

        context 'with user is manager' do 
            before { 
                get '/api/users.json', params: {}, headers: admin_auth_headers
            }

            it 'should get success' do 
                expect_status 200
            end

            it 'return all users' do 
                expect_json('users.0', { :id => admin.id, :name => admin.name })            
            end


        end
    end

end
