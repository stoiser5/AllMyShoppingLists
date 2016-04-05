# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

list1 = ShoppingList.create(name: 'Groceries', id: 1)
item1 = Item.create(item_name: 'Bread', store: 'ShopRite', shopping_list_id: 1)
item2 = Item.create(item_name: 'Milk', store: 'ShopRite', shopping_list_id: 1)

list2 = ShoppingList.create(name: 'Clothes for Clubbing', id: 2)
item3 = Item.create(item_name: 'Dress', store: 'Macys', shopping_list_id: 2)
item4 = Item.create(item_name: 'Pumps', store: 'Shoe4You', shopping_list_id: 2)
item5 = Item.create(item_name: 'Makeup', store: 'CVS', shopping_list_id: 2)