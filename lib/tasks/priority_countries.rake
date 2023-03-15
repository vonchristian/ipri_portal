# frozen_string_literal: true

task priority_countries: :environment do
  Country.where(name: ["Brazil", "Mexico", "Colombia", "Congo", "Philippines", "India"]).update_all(priority: true)
end

