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

Criminalizations::AccuserCategory.create!(title: "National Level Government Official")
Criminalizations::AccuserCategory.create!(title: "Federal Level Government Official")
Criminalizations::AccuserCategory.create!(title: "Local Government Official")
Criminalizations::AccuserCategory.create!(title: "Official in the Judiciary")
Criminalizations::AccuserCategory.create!(title: "Prison Official")
Criminalizations::AccuserCategory.create!(title: "Police")
Criminalizations::AccuserCategory.create!(title: "Armed Forces")
Criminalizations::AccuserCategory.create!(title: "Intelligence agency; Secret Service")
Criminalizations::AccuserCategory.create!(title: "Vigilante groups; death squads")
Criminalizations::AccuserCategory.create!(title: "Guerilla armies officials")
Criminalizations::AccuserCategory.create!(title: "National or local corporation")
Criminalizations::AccuserCategory.create!(title: "Transnational corporation")







