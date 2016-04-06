class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :created_by
      t.text :body
      t.text :recipients, array: true, default: []
      t.integer :recipient_total

      t.timestamps null: false
    end
  end
end
