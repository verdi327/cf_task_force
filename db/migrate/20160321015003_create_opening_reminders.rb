class CreateOpeningReminders < ActiveRecord::Migration
  def change
    create_table :opening_reminders do |t|
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
