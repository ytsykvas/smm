class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.text :title
      t.text :body
      t.string :status, default: 'open'
      t.date :closing_date, default: nil

      t.timestamps
    end
  end
end
