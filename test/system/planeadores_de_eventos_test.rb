require "application_system_test_case"

class PlaneadoresDeEventosTest < ApplicationSystemTestCase
  setup do
    @planeadores_de_evento = planeadores_de_eventos(:one)
  end

  test "visiting the index" do
    visit planeadores_de_eventos_url
    assert_selector "h1", text: "Planeadores de eventos"
  end

  test "should create planeadores de evento" do
    visit planeadores_de_eventos_url
    click_on "New planeadores de evento"

    fill_in "Costo", with: @planeadores_de_evento.costo
    fill_in "Descripcion", with: @planeadores_de_evento.descripcion
    fill_in "Fecha", with: @planeadores_de_evento.fecha
    fill_in "Titulo", with: @planeadores_de_evento.titulo
    fill_in "Ubicacion", with: @planeadores_de_evento.ubicacion
    click_on "Create Planeadores de evento"

    assert_text "Planeadores de evento was successfully created"
    click_on "Back"
  end

  test "should update Planeadores de evento" do
    visit planeadores_de_evento_url(@planeadores_de_evento)
    click_on "Edit this planeadores de evento", match: :first

    fill_in "Costo", with: @planeadores_de_evento.costo
    fill_in "Descripcion", with: @planeadores_de_evento.descripcion
    fill_in "Fecha", with: @planeadores_de_evento.fecha
    fill_in "Titulo", with: @planeadores_de_evento.titulo
    fill_in "Ubicacion", with: @planeadores_de_evento.ubicacion
    click_on "Update Planeadores de evento"

    assert_text "Planeadores de evento was successfully updated"
    click_on "Back"
  end

  test "should destroy Planeadores de evento" do
    visit planeadores_de_evento_url(@planeadores_de_evento)
    click_on "Destroy this planeadores de evento", match: :first

    assert_text "Planeadores de evento was successfully destroyed"
  end
end
