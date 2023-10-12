class AddEmailToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :email, :string
  end
end
