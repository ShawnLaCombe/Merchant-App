class AddIndexToCategories < ActiveRecord::Migration
  def change
    # add_column :categories, :name, :string
    add_index :categories, :name, unique: true
  end
end
