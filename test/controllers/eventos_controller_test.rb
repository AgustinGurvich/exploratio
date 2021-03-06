require 'test_helper'

class EventosControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
  end
  test "should get listaev" do
    get eventos_listaev_url
    assert_response :success
    assert_select "title", "Exploratio"
  end

  test "should get extensionev" do
    get eventos_extensionev_url
    assert_response :success
    assert_select "title", "Exploratio"
  end

  test "should get login" do
    get eventos_login_url
    assert_response :success
    assert_select "title", "Exploratio"
  end


end
