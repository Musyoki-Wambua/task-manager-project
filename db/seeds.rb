puts "deleting Old Data..."
User.destroy_all
Task.destroy_all

puts "Seeding..."

3.times do 
    User.create(
        full_name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end
2.times do 
    Task.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.sentence,
        createdAt: Faker::Time.between(from: DateTime.now - 7, to: DateTime.now),
        due: Faker::Time.forward(days: 10),
        status: Task.statuses.keys.sample

    )
end

puts "Done seeding ..."