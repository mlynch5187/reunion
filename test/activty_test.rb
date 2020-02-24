require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < MiniTest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_activities_exist
    assert_instance_of Activity, @activity
  end

  def test_activities_have_attributes
    assert_equal "Brunch", @activity.name
  end

end


# pry(main)> activity.name
# # => "Brunch"
#
# pry(main)> activity.participants
# # => {}
#
# pry(main)> activity.add_participant("Maria", 20)
#
# pry(main)> activity.participants
# # => {"Maria" => 20}
#
# pry(main)> activity.total_cost
# # => 20
#
# pry(main)> activity.add_participant("Luther", 40)
#
# pry(main)> activity.participants
# # => {"Maria" => 20, "Luther" => 40}
#
# pry(main)> activity.total_cost
# # => 60
