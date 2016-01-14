class AddImagesToCoaches < ActiveRecord::Migration
  def change
  	add_column :coaches, :images, :string, array: true, default: []
  end
end
