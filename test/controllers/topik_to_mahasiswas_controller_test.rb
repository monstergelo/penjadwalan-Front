require 'test_helper'

class TopikToMahasiswasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topik_to_mahasiswa = topik_to_mahasiswas(:one)
  end

  test "should get index" do
    get topik_to_mahasiswas_url
    assert_response :success
  end

  test "should get new" do
    get new_topik_to_mahasiswa_url
    assert_response :success
  end

  test "should create topik_to_mahasiswa" do
    assert_difference('TopikToMahasiswa.count') do
      post topik_to_mahasiswas_url, params: { topik_to_mahasiswa: { mahasiswa_id: @topik_to_mahasiswa.mahasiswa_id, topik_id: @topik_to_mahasiswa.topik_id } }
    end

    assert_redirected_to topik_to_mahasiswa_url(TopikToMahasiswa.last)
  end

  test "should show topik_to_mahasiswa" do
    get topik_to_mahasiswa_url(@topik_to_mahasiswa)
    assert_response :success
  end

  test "should get edit" do
    get edit_topik_to_mahasiswa_url(@topik_to_mahasiswa)
    assert_response :success
  end

  test "should update topik_to_mahasiswa" do
    patch topik_to_mahasiswa_url(@topik_to_mahasiswa), params: { topik_to_mahasiswa: { mahasiswa_id: @topik_to_mahasiswa.mahasiswa_id, topik_id: @topik_to_mahasiswa.topik_id } }
    assert_redirected_to topik_to_mahasiswa_url(@topik_to_mahasiswa)
  end

  test "should destroy topik_to_mahasiswa" do
    assert_difference('TopikToMahasiswa.count', -1) do
      delete topik_to_mahasiswa_url(@topik_to_mahasiswa)
    end

    assert_redirected_to topik_to_mahasiswas_url
  end
end
