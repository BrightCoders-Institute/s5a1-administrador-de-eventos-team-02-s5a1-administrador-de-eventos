require "test_helper"

class PlaneadoresDeEventosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planeadores_de_evento = planeadores_de_eventos(:one)
  end

  test "should get index" do
    get planeadores_de_eventos_url
    assert_response :success
  end

  test "should get new" do
    get new_planeadores_de_evento_url
    assert_response :success
  end

  test "should create planeadores_de_evento" do
    assert_difference("PlaneadoresDeEvento.count") do
      post planeadores_de_eventos_url, params: { planeadores_de_evento: { costo: @planeadores_de_evento.costo, descripcion: @planeadores_de_evento.descripcion, fecha: @planeadores_de_evento.fecha, titulo: @planeadores_de_evento.titulo, ubicacion: @planeadores_de_evento.ubicacion } }
    end

    assert_redirected_to planeadores_de_evento_url(PlaneadoresDeEvento.last)
  end

  test "should show planeadores_de_evento" do
    get planeadores_de_evento_url(@planeadores_de_evento)
    assert_response :success
  end

  test "should get edit" do
    get edit_planeadores_de_evento_url(@planeadores_de_evento)
    assert_response :success
  end

  test "should update planeadores_de_evento" do
    patch planeadores_de_evento_url(@planeadores_de_evento), params: { planeadores_de_evento: { costo: @planeadores_de_evento.costo, descripcion: @planeadores_de_evento.descripcion, fecha: @planeadores_de_evento.fecha, titulo: @planeadores_de_evento.titulo, ubicacion: @planeadores_de_evento.ubicacion } }
    assert_redirected_to planeadores_de_evento_url(@planeadores_de_evento)
  end

  test "should destroy planeadores_de_evento" do
    assert_difference("PlaneadoresDeEvento.count", -1) do
      delete planeadores_de_evento_url(@planeadores_de_evento)
    end

    assert_redirected_to planeadores_de_eventos_url
  end
end
