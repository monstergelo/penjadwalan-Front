require 'test_helper'

class MahasiswasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mahasiswa = mahasiswas(:one)
  end

  test "should get index" do
    get mahasiswas_url
    assert_response :success
  end

  test "should get new" do
    get new_mahasiswa_url
    assert_response :success
  end

  test "should create mahasiswa" do
    assert_difference('Mahasiswa.count') do
      post mahasiswas_url, params: { mahasiswa: { NIM: @mahasiswa.NIM, email: @mahasiswa.email, kategori: @mahasiswa.kategori, nama: @mahasiswa.nama } }
    end

    assert_redirected_to mahasiswa_url(Mahasiswa.last)
  end

  test "should show mahasiswa" do
    get mahasiswa_url(@mahasiswa)
    assert_response :success
  end

  test "should get edit" do
    get edit_mahasiswa_url(@mahasiswa)
    assert_response :success
  end

  test "should update mahasiswa" do
    patch mahasiswa_url(@mahasiswa), params: { mahasiswa: { NIM: @mahasiswa.NIM, email: @mahasiswa.email, kategori: @mahasiswa.kategori, nama: @mahasiswa.nama } }
    assert_redirected_to mahasiswa_url(@mahasiswa)
  end

  test "should destroy mahasiswa" do
    assert_difference('Mahasiswa.count', -1) do
      delete mahasiswa_url(@mahasiswa)
    end

    assert_redirected_to mahasiswas_url
  end
end
