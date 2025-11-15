require "test_helper"

class ConsultasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consultas_index_url
    assert_response :success
  end

  test "should get create" do
    get consultas_create_url
    assert_response :success
  end

  test "should get historico" do
    get consultas_historico_url
    assert_response :success
  end
end
