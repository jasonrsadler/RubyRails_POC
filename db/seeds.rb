# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
for ix in 1..100
  providers = Provider.create(email: 'tp' + ix.to_s + '@mail.com', \
    password: 'testtest', \
    first_name: 'Test', \
    last_name: 'Provider' + ix.to_s, birthdate: Date.new(1977, 8, 9), \
    zip: '23452', bypass_humanizer: true, phone: '7574444321', \
    address1: ix.to_s + 'Great Neck Rd', city: 'Virginia Beach', state: 'VA', \
    summary: 'PhD in Psycology and Masters in Counseling. LPC/LCSW/PhD/MD. Specializes in mood disorders, anxiety, depression.', \
    public: true, status: 1)
    
  clients = Client.create(email: 'tu' + ix.to_s + '@mail.com', \
    password: 'testtest', \
    first_name: 'Test', \
    last_name: 'Client' + ix.to_s, birthdate: Date.new(1977, 8, 9), \
    zip: '23454', bypass_humanizer: true, phone: '7575551234', \
    address1: ix.to_s + 'Little Neck Rd', city: 'Virginia Beach', state: 'VA')
  reviews = Review.create(provider_id: providers.id, client_id: clients.id, review: 'Good' + ix.to_s, rating: ix % 5 + 1)
  reviews2 = Review.create(provider_id: providers.id, client_id: clients.id, review: 'Bad' + ix.to_s, rating: ix % 2 + 1)
  reviews3 = Review.create(provider_id: providers.id, client_id: clients.id, review: 'Bad' + ix.to_s, rating: ix % 3 + 1)
  reviews4 = Review.create(provider_id: providers.id, client_id: clients.id, review: 'Bad' + ix.to_s, rating: ix % 4 + 1)
  reviews5 = Review.create(provider_id: providers.id, client_id: clients.id, review: 'Bad' + ix.to_s, rating: ix % 1 + 1)
end

if providers.errors.blank?
    puts "***providers seeding completed with no errors***"
    
else
    puts "providers seeding failed due to below reasons:"
    providers.errors.each do |x, y|
       puts "#{x} #{y}" # x will be the field name and y will be the error on it
     end
end

if reviews.errors.blank?
    puts "***reviews seeding completed with no errors***"
    
else
    puts "ratings seeding failed due to below reasons:"
    reviews.errors.each do |x, y|
       puts "#{x} #{y}" # x will be the field name and y will be the error on it
     end
end

if clients.errors.blank?
    puts "***clients seeding completed with no errors***"
    
else
    puts "clients seeding failed due to below reasons:"
    clients.errors.each do |x, y|
       puts "#{x} #{y}" # x will be the field name and y will be the error on it
     end
end
