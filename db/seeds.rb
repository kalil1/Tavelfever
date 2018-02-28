# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
def seed_db(models, object_count)
	models_collection, *_ = models.transpose
	counts = models_collection
		.map{|model| model.count }

	tables_filled = counts
		.map{|count| count >= object_count}
		.all?
	if tables_filled
		puts "Tables are full of data: #{object_count}"
		models_collection.zip(counts).each do |m, c|
			puts "model: #{m}, count: #{c}"
		end
	end
	unless tables_filled
		puts "Creating models...#{models_collection}"
		models.each do |model, model_attrs, faker_attrs|
			object_count.times do
				data_values = faker_attrs.map do |faker_module, faker_method, args|
					faker_module.send(faker_method, *args)
				end
				data = Hash[model_attrs.zip(data_values)]
				data[:user] = User.all.sample
				p model.create!(data)
			end
		end
	end
end

object_count = 100
non_user_models = [
	[
		Checklist, # model
		[
			:list_name,
		],
		[
			[
				# name
				Faker::Lorem,
				:sentence,
				[],
			],
		],
	], # end of Article
]

def seed_users(password, user_count)
	# users need unique emails
	# all have same password
	# password_digest = BCrypt::Password.create(password)
	user_models = [
		[
			User,
			[
				:email,
			],
			[
				[
					Faker::Internet,
					:email,
					[],
				],
			],
		],
	]

	models_collection, *_ = user_models.transpose
	counts = models_collection
		.map{|model| model.count }

	tables_filled = counts
		.map{|count| count >= user_count}
		.all?
	if tables_filled
		puts "Tables are full of data: #{user_count}"
		models_collection.zip(counts).each do |m, c|
			puts "model: #{m}, count: #{c}"
		end
	end
	unless tables_filled
		puts "Creating models...#{models_collection}"
		user_models.each do |model, model_attrs, faker_attrs|
			model_attrs << :password
			user_count.times do |i|
				data_values = faker_attrs.map do |faker_module, faker_method, args|
					faker_module.send(:unique).send(faker_method)
				end
				# add password to attrs and values
				data_values << password
				user = model.new(Hash[model_attrs.zip(data_values)])
				user.save(validate: false)
			end
		end
	end

	User.all.each do |user|
		puts "#{user.email}"
		puts "#{password}"
	end
end


seed_users('asdfasdf', 10)
seed_db(non_user_models, object_count)
puts "Running `rails db:seed` is idempotent. Running more than once will not add rows to the database past the set counts."
