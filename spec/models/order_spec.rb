require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Associations' do 
    it { should belong_to(:customer) }
    it { should have_many(:order_items).dependent(:destroy) }
  end 
end 