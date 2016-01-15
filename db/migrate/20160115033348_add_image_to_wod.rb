class AddImageToWod < ActiveRecord::Migration
  def change
    add_column :wods, :image, :string
  end
end
