class CreateAgeBrackets < ActiveRecord::Migration[7.0]
  def change
    create_table :age_brackets do |t|
      t.integer :min_age
      t.integer :max_age
      t.string :name

      t.timestamps
    end
  end
end
