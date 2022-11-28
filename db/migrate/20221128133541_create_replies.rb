class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.references :post, null: false, foreign_key: true
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
