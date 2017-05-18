require 'test_helper'

class PengujisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @penguji = pengujis(:one)
  end

  test "should get index" do
    get pengujis_url
    assert_response :success
  end

  test "should get new" do
    get new_penguji_url
    assert_response :success
  end

  test "should create penguji" do
    assert_difference('Penguji.count') do
      post pengujis_url, params: { penguji: { dosen_id: @penguji.dosen_id, mahasiswa_id: @penguji.mahasiswa_id } }
    end

    assert_redirected_to penguji_url(Penguji.last)
  end

  test "should show penguji" do
    get penguji_url(@penguji)
    assert_response :success
  end

  test "should get edit" do
    get edit_penguji_url(@penguji)
    assert_response :success
  end

  test "should update penguji" do
    patch penguji_url(@penguji), params: { penguji: { dosen_id: @penguji.dosen_id, mahasiswa_id: @penguji.mahasiswa_id } }
    assert_redirected_to penguji_url(@penguji)
  end

  test "should destroy penguji" do
    assert_difference('Penguji.count', -1) do
      delete penguji_url(@penguji)
    end

    assert_redirected_to pengujis_url
  end
end
