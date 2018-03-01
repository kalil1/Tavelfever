# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

activities = [
	[1, 'Gym'],
	[2, 'Running'],
	[3, 'Swimming'],
	[4, 'Business Formal'],
	[5, 'Snow Sport'],
	[6, 'Beach'],
	[7, 'Hiking'],
	[8, 'Dinner'],
	[9, 'Camping']

]
activities.each do |activity|
Activity.create(:id => activity[0], :name => activity[1])
end


items = [
	[ "Gym shoes", 1],
	[ "Gym Towel", 1],
	[ "Shorts", 1],
	[ "Deodorant", 1],
	[ 'Running Shoes', 2],
	[ 'Running Socks', 2],
	[ 'Running Shorts', 2],
	[ 'Running Shirt', 2],
	[ 'Music Player', 2],
	[ 'Running
		Headphones', 2],
		[ 'Pool Swimsuit', 3],
		[ 'Swimsuit Coverup', 3],
		[ 'Goggles', 3],
		[ 'Sandals', 3],
		[ 'Business Formal', 3],
		[ 'Hosiery', 4],
		[ 'Work Shirt (3)', 4],
		[ 'Work Pants(2)', 4],
		[ 'work shoes', 4],
		[ 'Work Socks(6)', 4],
		[ 'Work Belt', 4],
		[ 'Formal Watch', 4],
		[ 'Skirt', 4],
		[ 'Dress', 4],
		[ 'Jewelry', 4],
		[ 'Suit Jacket(2)', 4],
		[ 'Long Underwear', 5],
		[ 'Snow Pants', 5],
		[ 'Snow Pants', 5],
		[ 'Snow Hat/beanie', 5],
		[ 'Sunglasses', 5],
		[ 'Snow Gloves', 5],
		[ 'Chapstick', 5],
		[ 'Skin Moisturizer', 5],
		[ 'Sunscreen', 5],
		[ 'Snow Jacket', 5],
		[ 'Sunscreen', 6],
		[ 'Swimsuit Coverup', 6],
		[ 'Sunglasses', 6],
		[ 'Beach Swimsuit', 6],
		[ 'Hat', 6],
		[ 'Sandals', 6],
		[ 'Beach towel', 6],
		[ 'Handheld GPS', 7],
		[ 'Shirts(non-cotton)', 7],
		[ 'Pants(non-cotton)', 7],
		[ 'Socks (non-cotton)', 7],
		[ 'Sunglasses', 7],
		[ 'Water Bottle', 7],
		[ 'Hat', 7],
		[ 'Sunscreen', 7],
		[ 'Bug Spray', 7],
		[ 'First Aid Kit', 7],
		[ 'Compass, hiking Shoes', 7],
		["Cardigan", 8],
		["Pants", 8],
		["Dress", 8], ["Skirt", 8],
		["Dress Shoes", 8],
		["Jewelry", 8],
		["Hair Blow Dryer", 8],
		["Hair Blow Dryer", 8],
		["Hair Products", 8],
		["Pantyhose", 8],
		["Jacket", 8],
		["Blouse", 8],
		[ 'Sleeping Bag', 9],
		[ 'Sleeping Pad', 9],
		[ 'Pillow', 9],
		[ 'Eating Utensils', 9],
		[ 'Cooking Tools', 9],
		[ 'Flashlight', 9],
		[ 'Headlamp', 9],
		[ 'Firewood', 9],
		[ 'Matches/lighter', 9],
		[ 'Camping Food', 9],
		[ 'Snacks', 9],
		[ 'Tick Remover', 9],
		[ 'Bug sprayy', 9],
		[ 'shirts', 9],
		[ 'Pants', 9],
		[ 'Socks', 9],
		[ 'First Aid Kit', 9],
		[ 'Water Filter', 9],
		[ 'Compass', 9],
		[ 'Handheld GPS', 9],
		[ 'Towel', 9],
		[ 'Utility Knife', 9],
		[ 'Tent', 9]

	]

	items.each do |country|
		Item.create( :iname => country[0], :activity_id => country[1] )
	end





p "Done"
