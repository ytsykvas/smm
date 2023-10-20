class ChangeUserTypeDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :user_type, 'regular'
  end
end
