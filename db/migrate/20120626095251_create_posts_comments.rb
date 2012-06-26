class CreatePostsComments < ActiveRecord::Migration
  def change
    create_table :posts_comments do |t|
      t.text :comment
      t.references :posts

      t.timestamps
    end
    add_index :posts_comments, :posts_id
  end
end
