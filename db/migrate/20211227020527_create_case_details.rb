class CreateCaseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :case_details, id: :uuid do |t|
      t.string  :organization_name, null: false
      t.integer :submission_date_year, null: false
      t.integer :submission_date_day, null: false
      t.string  :submission_date_month, null: false
      t.integer :incident_start_year, null: false
      t.integer :incident_start_day, null: false
      t.string  :incident_start_month, null: false
      t.integer :incident_end_year
      t.integer :incident_end_day
      t.string  :incident_end_month
      t.integer :incident_hour
      t.integer :incident_minute
      t.string  :time_period

      t.string :reference_number, null: false
      t.boolean :primary_data, null: false, default: false
      t.string :data_sharing, null: false
      t.belongs_to :country, foreign_key: true, type: :uuid
      t.string :subnational_location
      t.string :location_details_1
      t.string :location_details_2

      t.timestamps
    end
    add_index :case_details, :reference_number, unique: true
    add_index :case_details, :data_sharing
  end
end
