require "test_helper"

class EventPlannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_planner = event_planners(:one)
  end

  test "should get index" do
    get event_planners_url
    assert_response :success
  end

  test "should get new" do
    get new_event_planner_url
    assert_response :success
  end

  test "should create event_planner" do
    assert_difference("EventPlanner.count") do
      post event_planners_url, params: { event_planner: { costo: @event_planner.costo, descripcion: @event_planner.descripcion, fecha: @event_planner.fecha, titulo: @event_planner.titulo, ubicacion: @event_planner.ubicacion } }
    end

    assert_redirected_to event_planner_url(EventPlanner.last)
  end

  test "should show event_planner" do
    get event_planner_url(@event_planner)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_planner_url(@event_planner)
    assert_response :success
  end

  test "should update event_planner" do
    patch event_planner_url(@event_planner), params: { event_planner: { costo: @event_planner.costo, descripcion: @event_planner.descripcion, fecha: @event_planner.fecha, titulo: @event_planner.titulo, ubicacion: @event_planner.ubicacion } }
    assert_redirected_to event_planner_url(@event_planner)
  end

  test "should destroy event_planner" do
    assert_difference("EventPlanner.count", -1) do
      delete event_planner_url(@event_planner)
    end

    assert_redirected_to event_planners_url
  end
end
