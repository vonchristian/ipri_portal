# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AgeBracket.create!(name: "A", min_age: 0, max_age: 14)
AgeBracket.create!(name: "B", min_age: 15, max_age: 24)
AgeBracket.create!(name: "C", min_age: 25, max_age: 59)
AgeBracket.create!(name: "D", min_age: 60, max_age: 200)

AccuserCategory.create!(name: "National Level Government Official")
AccuserCategory.create!(name: "Federal Level Government Official")
AccuserCategory.create!(name: "Local Government Official")
AccuserCategory.create!(name: "Official in the Judiciary")
AccuserCategory.create!(name: "Prison Official")
AccuserCategory.create!(name: "Police")
AccuserCategory.create!(name: "Armed Forces")
AccuserCategory.create!(name: "Intelligence agency; Secret Service")
AccuserCategory.create!(name: "Vigilante groups; death squads")
AccuserCategory.create!(name: "Guerilla armies officials")
AccuserCategory.create!(name: "National or local corporation")
AccuserCategory.create!(name: "Transnational corporation")







