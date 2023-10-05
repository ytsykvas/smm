# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Очищення бази даних перед заповненням
puts "Clearing the database..."
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE") unless table == 'schema_migrations'
end

puts "Creating users with Devise and Faker..."
10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'blink182',
    password_confirmation: 'blink182'
  )
end

puts "Seeds with Devise and Faker have been created successfully!"
Social.create!([
                 { name: 'Instagram' },
                 { name: 'Tik-Tok' },
                 { name: 'Tweeter' }
               ])
puts '______Seeded______'