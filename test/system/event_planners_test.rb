require "application_system_test_case"

class EventPlannersTest < ApplicationSystemTestCase
  setup do
    @event_planner = event_planners(:one)
  end

  test "visiting the index" do
    visit event_planners_url
    assert_selector "h1", text: "Event planners"
  end

  test "should create event planner" do
    visit event_planners_url
    click_on "New event planner"

    fill_in "Costo", with: @event_planner.costo
    fill_in "Descripcion", with: @event_planner.descripcion
    fill_in "Fecha", with: @event_planner.fecha
    fill_in "Titulo", with: @event_planner.titulo
    fill_in "Ubicacion", with: @event_planner.ubicacion
    click_on "Create Event planner"

    assert_text "Event planner was successfully created"
    click_on "Back"
  end

  test "should update Event planner" do
    visit event_planner_url(@event_planner)
    click_on "Edit this event planner", match: :first

    fill_in "Costo", with: @event_planner.costo
    fill_in "Descripcion", with: @event_planner.descripcion
    fill_in "Fecha", with: @event_planner.fecha
    fill_in "Titulo", with: @event_planner.titulo
    fill_in "Ubicacion", with: @event_planner.ubicacion
    click_on "Update Event planner"

    assert_text "Event planner was successfully updated"
    click_on "Back"
  end

  test "should destroy Event planner" do
    visit event_planner_url(@event_planner)
    click_on "Destroy this event planner", match: :first

    assert_text "Event planner was successfully destroyed"
  end
end
