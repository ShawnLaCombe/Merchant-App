class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  # line items depends on carts being there if not there destroy items
def subtotal
  #SQL version of summing which is much faster than Ruby
  line_items.select("SUM(quantity * price) AS sum")[0].sum
  # Ruby version of sum
  # line_items.to_a.sum {|item| item.total}
end

end
