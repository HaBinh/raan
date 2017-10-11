require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Associations' do 
    it { should have_many(:articles) }
    it { should belong_to(:order)}
  end  
end