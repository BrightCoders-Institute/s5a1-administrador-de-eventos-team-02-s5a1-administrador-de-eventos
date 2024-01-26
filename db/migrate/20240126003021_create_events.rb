class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :titulo
      t.text :descripcion
      t.datetime :fecha
      t.text :ubicacion
      t.float :costo

      t.timestamps
    end
  end
end
