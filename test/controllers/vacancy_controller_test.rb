require "test_helper"

class VacancyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vacancy_new_url
    assert_response :success
  end

  test "should get create" do
    get vacancy_create_url
    assert_response :success
  end

  test "should get update" do
    get vacancy_update_url
    assert_response :success
  end

  test "should get edit" do
    get vacancy_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get vacancy_destroy_url
    assert_response :success
  end

  test "should get index" do
    get vacancy_index_url
    assert_response :success
  end

  test "should get show" do
    get vacancy_show_url
    assert_response :success
  end
end
