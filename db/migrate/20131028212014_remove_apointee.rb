class RemoveApointee < ActiveRecord::Migration
  def change
    remove_column :appointments, :apointee_id
  end
end
