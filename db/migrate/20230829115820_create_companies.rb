class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.text :name
      t.integer :social_id
      t.text :information
      t.datetime :started_at
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
