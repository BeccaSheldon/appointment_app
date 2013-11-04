class AddColumnToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :date, :time
  end
end
