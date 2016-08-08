
namespace :db do 
  desc "Clear the DB and fill with sample data"
  
  task populate: :environment do 
    require 'populator'
    require 'faker'
    [Product,Category].each { |i| i.destroy_all}

    Brand.all.each do |brand|

      Category.populate(1..2) do  |category|
        category.name = Faker::Name.name

        Product.populate(5..10) do |product|
          product.name = Faker::Name.name
          product.price = Faker::Commerce.price
          product.quantity = Faker::Number.between(1, 50)
          product.description = Faker::Hacker.say_something_smart
          product.category_id = category.id 
          product.brand_id = brand.id



      puts "It ran right"
        end
      end
    end
  end
end # namespace