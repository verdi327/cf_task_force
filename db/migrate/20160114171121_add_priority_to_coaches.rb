class AddPriorityToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :priority, :string
  end
end
