require 'test_helper'

class DosensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dosen = dosens(:one)
  end

  test "should get index" do
    get dosens_url
    assert_response :success
  end

  test "should get new" do
    get new_dosen_url
    assert_response :success
  end

  test "should create dosen" do
    assert_difference('Dosen.count') do
      post dosens_url, params: { dosen: { NIP: @dosen.NIP, email: @dosen.email, nama: @dosen.nama } }
    end

    assert_redirected_to dosen_url(Dosen.last)
  end

  test "should show dosen" do
    get dosen_url(@dosen)
    assert_response :success
  end

  test "should get edit" do
    get edit_dosen_url(@dosen)
    assert_response :success
  end

  test "should update dosen" do
    patch dosen_url(@dosen), params: { dosen: { NIP: @dosen.NIP, email: @dosen.email, nama: @dosen.nama } }
    assert_redirected_to dosen_url(@dosen)
  end

  test "should destroy dosen" do
    assert_difference('Dosen.count', -1) do
      delete dosen_url(@dosen)
    end

    assert_redirected_to dosens_url
  end
end
