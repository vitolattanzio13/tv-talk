class AddColumsToReplies < ActiveRecord::Migration[7.0]
  def change
    add_reference :replies, :notification, foreign_key: true
    add_column :replies, :read, :boolean, null: false, default: false
  end
end
