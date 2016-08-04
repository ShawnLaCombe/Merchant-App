# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brand = ["poodle","party","german landscaping", "australian dodads", " Kortie", "animation", "great dane", "doberman", "redbull", "rot", "jackel", "chiana", "forever", "pokemon"]

  brand.each do |brand|
    Brand.create(name: brand)
    end

    puts "It did something"