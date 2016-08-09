class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  # line items depends on carts being there if not there destroy items
end
