class Brand < ActiveRecord::Base
  has_many :products
 # every brand has to have name and uniqueness 
  validates :name, presence: true, uniqueness: true
end
