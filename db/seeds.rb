# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


products = Product.create([
    {name: "item1", sku: "SKU1",price: 12000,quantity: 10},
    {name: "item2", sku: "SKU2",price: 10000,quantity: 20},
])


user = User.create([
    {name: "user1", email: "eamil1@gmail.com",mobile: 9999122312},
    {name: "user2", email: "email2@gmail.com",mobile: 9999122312},
])

user = Deal.create([
    {deals_name: "deal1", products_id: 1,item_qty: 5,offer_price: 10000,start_time:"2021-12-11 12:00:00",end_time:"2021-12-11 14:00:00"},
    {deals_name: "deal2", products_id: 2,item_qty: 7,offer_price: 9000,start_time:"2021-12-11 16:00:00",end_time:"2021-12-11 21:00:00"},
])