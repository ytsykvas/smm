class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :phone
      t.boolean :remotely
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
