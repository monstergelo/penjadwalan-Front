require 'test_helper'

class TopikToDosensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topik_to_dosen = topik_to_dosens(:one)
  end

  test "should get index" do
    get topik_to_dosens_url
    assert_response :success
  end

  test "should get new" do
    get new_topik_to_dosen_url
    assert_response :success
  end

  test "should create topik_to_dosen" do
    assert_difference('TopikToDosen.count') do
      post topik_to_dosens_url, params: { topik_to_dosen: { dosen_id: @topik_to_dosen.dosen_id, topik_id: @topik_to_dosen.topik_id } }
    end

    assert_redirected_to topik_to_dosen_url(TopikToDosen.last)
  end

  test "should show topik_to_dosen" do
    get topik_to_dosen_url(@topik_to_dosen)
    assert_response :success
  end

  test "should get edit" do
    get edit_topik_to_dosen_url(@topik_to_dosen)
    assert_response :success
  end

  test "should update topik_to_dosen" do
    patch topik_to_dosen_url(@topik_to_dosen), params: { topik_to_dosen: { dosen_id: @topik_to_dosen.dosen_id, topik_id: @topik_to_dosen.topik_id } }
    assert_redirected_to topik_to_dosen_url(@topik_to_dosen)
  end

  test "should destroy topik_to_dosen" do
    assert_difference('TopikToDosen.count', -1) do
      delete topik_to_dosen_url(@topik_to_dosen)
    end

    assert_redirected_to topik_to_dosens_url
  end
end
