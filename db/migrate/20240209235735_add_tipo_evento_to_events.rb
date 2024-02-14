class AddTipoEventoToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :tipo_de_eventos, :string
  end
end
