# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AgeBracket.create!(name: "A", min_age: 0, max_age: 12,  description: "0 - 12 years old")
AgeBracket.create!(name: "B", min_age: 13, max_age: 25, description: "13 - 25 years old")
AgeBracket.create!(name: "C", min_age: 26, max_age: 35, description: "26 - 35 years old")
AgeBracket.create!(name: "D", min_age: 36, max_age: 59, description: "36 - 59 years old")
AgeBracket.create!(name: "E", min_age: 60, max_age: 200, description: "60 years old and above")


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

Killings::PerpetratorCategory.create!(title: "National Level Government Official")
Killings::PerpetratorCategory.create!(title: "Federal Level Government Official")
Killings::PerpetratorCategory.create!(title: "Local Government Official")
Killings::PerpetratorCategory.create!(title: "Official in the Judiciary")
Killings::PerpetratorCategory.create!(title: "Prison Official")
Killings::PerpetratorCategory.create!(title: "Police")
Killings::PerpetratorCategory.create!(title: "Armed Forces")
Killings::PerpetratorCategory.create!(title: "Intelligence agency; Secret Service")
Killings::PerpetratorCategory.create!(title: "Vigilante groups; death squads")
Killings::PerpetratorCategory.create!(title: "Guerilla armies officials")
Killings::PerpetratorCategory.create!(title: "National or local corporation")
Killings::PerpetratorCategory.create!(title: "Transnational corporation")

HumanRightsViolations::Category.create!(title: "Violation of collective right to free, prior and informed consent")
HumanRightsViolations::Category.create!(title: "Arbitrary detention")
HumanRightsViolations::Category.create!(title: "Forced displacement")
HumanRightsViolations::Category.create!(title: "Enforced disappearance")
HumanRightsViolations::Category.create!(title: "Sexual Violence and other forms of gender-based violence")
HumanRightsViolations::Category.create!(title: "Land grabbing")
HumanRightsViolations::Category.create!(title: "Physical injury/Beatings/Torture")
HumanRightsViolations::Category.create!(title: "Forced eviction")
HumanRightsViolations::Category.create!(title: "Kidnapping")
HumanRightsViolations::Category.create!(title: "State-sponsored Vilification (terrorist-tagging, red-baiting, red-tagging)")
HumanRightsViolations::Category.create!(title: "Online Attacks (Smear campaign, misinformation)")


HumanRightsViolations::PerpetratorCategory.create!(title: "National Level Government Official")
HumanRightsViolations::PerpetratorCategory.create!(title: "Federal Level Government Official")
HumanRightsViolations::PerpetratorCategory.create!(title: "Local Government Official")
HumanRightsViolations::PerpetratorCategory.create!(title: "Official in the Judiciary")
HumanRightsViolations::PerpetratorCategory.create!(title: "Prison Official")
HumanRightsViolations::PerpetratorCategory.create!(title: "Police")
HumanRightsViolations::PerpetratorCategory.create!(title: "Armed Forces")
HumanRightsViolations::PerpetratorCategory.create!(title: "Intelligence agency; Secret Service")
HumanRightsViolations::PerpetratorCategory.create!(title: "Vigilante groups; death squads")
HumanRightsViolations::PerpetratorCategory.create!(title: "Guerilla armies officials")
HumanRightsViolations::PerpetratorCategory.create!(title: "National or local corporation")
HumanRightsViolations::PerpetratorCategory.create!(title: "Transnational corporation")

ISO3166::Country.all.collect(&:iso_short_name).each { |name| Country.create!(name: name) }

DevelopmentProjects::Category.create!(name: "Infrastructure (roads, urbanization, water systems, telecommunications, and others)")
DevelopmentProjects::Category.create!(name: "Conservation (Protected Area Designation, Wildlife, Water, Reforestation and Others)")
DevelopmentProjects::Category.create!(name: "Agribusiness (corporate, monocrops, plantations, and others)")
DevelopmentProjects::Category.create!(name: "Energy (Non-renewwable Resources e.g., fossil fuels, coal, Uranium, Fracking, and others)")
DevelopmentProjects::Category.create!(name: "Mining (gold, silver, diamonds, sands, and other metals and minerals)")
DevelopmentProjects::Category.create!(name: "Tourism (Ecotourism, and others)")
DevelopmentProjects::Category.create!(name: "Transition Energy (Solar, Wind, Hydro, Biomass, Geothermal, and others)")
DevelopmentProjects::Category.create!(name: "Deforestation (Logging, Manufacturing, and others)")
DevelopmentProjects::Category.create!(name: "No Information")

AdminUser.create!(
  first_name: "Admin",
  last_name: "Admin",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
) if Rails.env.development?

Victims::CollectiveVictimCategory.create!(name: "Individuals")
Victims::CollectiveVictimCategory.create!(name: "Families")
Victims::CollectiveVictimCategory.create!(name: "Homes")
Victims::CollectiveVictimCategory.create!(name: "Groups")
Victims::CollectiveVictimCategory.create!(name: "Communities")
Victims::CollectiveVictimCategory.create!(name: "Villages")
