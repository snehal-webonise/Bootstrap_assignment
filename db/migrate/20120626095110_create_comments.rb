class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :posts

      t.timestamps
    end
    add_index :comments, :posts_id
  end
end
