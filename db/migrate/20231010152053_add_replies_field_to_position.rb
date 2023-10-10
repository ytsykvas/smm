class AddRepliesFieldToPosition < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :replies, :integer, default: 0
  end
end
