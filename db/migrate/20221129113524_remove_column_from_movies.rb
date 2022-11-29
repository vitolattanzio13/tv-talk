class RemoveColumnFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :type, :string
    add_column :movies, :media_type, :string
  end
end
