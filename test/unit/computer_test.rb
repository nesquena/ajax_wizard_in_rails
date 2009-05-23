require 'test_helper'

class ComputerTest < ActiveSupport::TestCase
  test "has section types" do
    assert_not_nil Computer.section_types
  end
end
