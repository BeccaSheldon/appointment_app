class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :location
      t.references :appointee_id
      t.references :user

      t.timestamps
    end
  end
end
