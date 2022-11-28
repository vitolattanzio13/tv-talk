class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0

      t.timestamps
    end
  end
end
