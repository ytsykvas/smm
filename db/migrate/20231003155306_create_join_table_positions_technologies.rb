class CreateJoinTablePositionsTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_join_table :positions, :technologies do |t|
      t.index [:position_id, :technology_id]
      t.index [:technology_id, :position_id]
    end
  end
end
