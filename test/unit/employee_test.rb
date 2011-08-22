require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: employees
#
#  id         :integer         not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  title      :string(255)
#  department :string(255)
#  extension  :integer
#  mobile     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

