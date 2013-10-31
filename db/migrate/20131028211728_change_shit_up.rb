class ChangeShitUp < ActiveRecord::Migration
  def change
    remove_column :appointments, :apointee_id
    add_column :appointments, :apointee_id, :integer

    remove_column :appointments, :user_id
    add_column :appointments, :user_id, :integer
  end
end
