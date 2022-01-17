class CreateFactSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :fact_sheets do |t|
      t.string :documenter_first_name, null: false
      t.string :documenter_last_name, null: false
      t.string :documenter_organization_name, null: false
      t.integer :submission_date_year, null: false
      t.integer :submission_date_day, null: false
      t.string :submission_date_month, null: false

      t.integer :incident_start_year, null: false
      t.integer :incident_start_day, null: false
      t.string  :incident_start_month, null: false

      t.integer :incident_end_year
      t.integer :incident_end_day
      t.string  :incident_end_month
      t.integer :incident_hour
      t.integer :incident_minute
      t.string :time_period

      t.string :reference_number, null: false
      t.string :documenter_email
      t.string :documenter_phone_number
      t.boolean :primary_data, null: false, default: false
      t.boolean :data_sharing_restricted, default: false
      t.boolean :data_sharing_unrestricted, default: false
      t.belongs_to :country, foreign_key: true
      t.string :subnational_location
      t.string :location_details_1
      t.string :location_details_2

      t.timestamps
    end
    add_index :fact_sheets, :reference_number, unique: true
  end
end
