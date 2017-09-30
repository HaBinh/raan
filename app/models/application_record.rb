class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  private 
    def private_id
      SecureRandom.hex(6)
    end
end