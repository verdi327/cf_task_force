require "test_helper"

class LeadsControllerTest < ActionController::TestCase
  def lead
    @lead ||= leads :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:leads)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Lead.count") do
      post :create, lead: { email: lead.email, first_name: lead.first_name, phone_number: lead.phone_number }
    end

    assert_redirected_to lead_path(assigns(:lead))
  end

  def test_show
    get :show, id: lead
    assert_response :success
  end

  def test_edit
    get :edit, id: lead
    assert_response :success
  end

  def test_update
    put :update, id: lead, lead: { email: lead.email, first_name: lead.first_name, phone_number: lead.phone_number }
    assert_redirected_to lead_path(assigns(:lead))
  end

  def test_destroy
    assert_difference("Lead.count", -1) do
      delete :destroy, id: lead
    end

    assert_redirected_to leads_path
  end
end
