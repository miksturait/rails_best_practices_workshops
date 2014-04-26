# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


unless User.exists?
  user = User.create(name: 'Tony',
                     email: 'tiny@bravo.dev',
                     password: 'secret',
                     password_confirmation: 'secret')


  25.times { |i| Tender.create(title: "Request #{i}",
                                description: "Description #{i}",
                                user_id: user.id) }
end
