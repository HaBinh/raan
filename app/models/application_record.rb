class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  private 
    def private_id
      SecureRandom.hex(3).upcase
    end
end