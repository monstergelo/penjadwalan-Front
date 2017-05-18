require 'test_helper'

class PembimbingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pembimbing = pembimbings(:one)
  end

  test "should get index" do
    get pembimbings_url
    assert_response :success
  end

  test "should get new" do
    get new_pembimbing_url
    assert_response :success
  end

  test "should create pembimbing" do
    assert_difference('Pembimbing.count') do
      post pembimbings_url, params: { pembimbing: { dosen_id: @pembimbing.dosen_id, mahasiswa_id: @pembimbing.mahasiswa_id } }
    end

    assert_redirected_to pembimbing_url(Pembimbing.last)
  end

  test "should show pembimbing" do
    get pembimbing_url(@pembimbing)
    assert_response :success
  end

  test "should get edit" do
    get edit_pembimbing_url(@pembimbing)
    assert_response :success
  end

  test "should update pembimbing" do
    patch pembimbing_url(@pembimbing), params: { pembimbing: { dosen_id: @pembimbing.dosen_id, mahasiswa_id: @pembimbing.mahasiswa_id } }
    assert_redirected_to pembimbing_url(@pembimbing)
  end

  test "should destroy pembimbing" do
    assert_difference('Pembimbing.count', -1) do
      delete pembimbing_url(@pembimbing)
    end

    assert_redirected_to pembimbings_url
  end
end
