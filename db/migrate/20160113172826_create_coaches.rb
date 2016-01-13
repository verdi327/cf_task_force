class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
