class CreateEventFilters < ActiveRecord::Migration[7.0]
  def change
    create_table :event_filters do |t|
      t.string :tipo_de_eventos
      t.date :fecha_inicio
      t.date :fecha_final

      t.timestamps
    end
  end
end
