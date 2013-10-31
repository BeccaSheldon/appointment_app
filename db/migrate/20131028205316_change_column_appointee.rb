class ChangeColumnAppointee < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointee_id_id
    add_reference :appointments, :appointee
  end
end
