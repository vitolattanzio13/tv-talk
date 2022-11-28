class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.string :trailer_url
      t.string :imdb_id
      t.string :type
      t.string :plot_short
      t.text :plot_long
      t.integer :year
      t.float :rating

      t.timestamps
    end
  end
end
