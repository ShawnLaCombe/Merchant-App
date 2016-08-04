class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand

  has_attached_file :avatar, 
  styles:{ medium: "300x300#", thumb: "100x100#"},
  default_url: "missing_:style.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_size :avatar, less_than: 3.megabytes, unless: Proc.new{
    |m| m[:avatar_file_name].blank?}

  validates :name, presence: true 
  validates :price, presence: true 
  validates :quantity, presence: true
  validates :description, presence: true
  validates :category_id, presence: true 
  validates :brand_id, presence: true 
  
end

