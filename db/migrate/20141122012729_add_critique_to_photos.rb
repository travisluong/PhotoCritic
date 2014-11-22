class AddCritiqueToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :critique, :text
  end
end
