class AddUserTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :string, default: 'regular', null: false
  end
end
