class CreateNewspapers < ActiveRecord::Migration[7.0]
  def change
    create_table :newspapers do |t|
      t.string :title
      t.string :content
      t.string :image_url

      t.timestamps
    end
  end
end
