class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.string :name
      t.date :publish_on

      t.timestamps null: false
    end
  end
end
