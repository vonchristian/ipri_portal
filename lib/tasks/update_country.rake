# frozen_string_literal: true

task update_countries: :environment do
  Country.all.each(&:save!)
end

