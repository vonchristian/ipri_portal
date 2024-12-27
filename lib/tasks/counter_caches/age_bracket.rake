# frozen_string_literal: true
#
namespace :backfill do
desc "Backfill individual_victims_count for age brackets"
task age_bracket_individual_victims_count: :environment do
  puts "Starting backfill for individual_victims_count..."

  AgeBracket.find_each do |age_bracket|
    AgeBracket.reset_counters(age_bracket.id, :individual_victims)
    puts "Backfilled age bracket #{age_bracket.id} (individual_victims_count: #{age_bracket.individual_victims_count})"
  end

  puts "Backfill completed."
end
end