class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_column :posts, :image, :string
  end
end
