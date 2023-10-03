class AddExperienceToPositions < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :experience, :integer
  end
end
