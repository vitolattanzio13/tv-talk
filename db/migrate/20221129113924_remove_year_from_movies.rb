class RemoveYearFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :year, :integer
    add_column :movies, :year, :string
  end
end
