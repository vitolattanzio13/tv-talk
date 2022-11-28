class CreateReplyVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :reply_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
