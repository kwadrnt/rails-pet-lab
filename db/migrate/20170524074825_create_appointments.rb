class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :reason
      t.string :veterinarian
      t.references :pet
      t.string :key

      t.timestamps
    end
  end
end
