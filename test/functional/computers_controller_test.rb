require 'test_helper'

class ComputersControllerTest < ActionController::TestCase
  test "for create action should redirect to computers path" do
    post :create, { :computer => { :processor => "test"} }
    assert_redirected_to computers_path
  end
end
