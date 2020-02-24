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
    assert_equal ({}), @activity.participants
  end

  def test_participants_can_be_added
    assert_equal ({}), @activity.participants

    @activity.add_participant("Maria", 20)

    assert_equal ({"Maria" => 20}), @activity.participants
  end

  def test_total_cost_can_be_calculated
    @activity.add_participant("Maria", 20)

    assert_equal 20, @activity.total_cost

    @activity.add_participant("Luther", 40)

    assert_equal ({"Maria" => 20, "Luther" => 40}), @activity.participants
    assert_equal 60, @activity.total_cost
  end

  def test_total_cost_can_be_split_among_participants
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 60, @activity.total_cost
    assert_equal 30, @activity.split
  end

  def test_amount_owed_can_be_calculated
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal ({"Maria" => 10, "Luther" => -10}), @activity.owed
  end
end

# pry(main)> activity.owed
# # => {"Maria" => 10, "Luther" => -10}
# ```
#
# Additionaly, use TDD to create a Reunion class that responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require './lib/reunion'
# # => true
#
# pry(main)> reunion = Reunion.new("1406 BE")
# # => #<Reunion:0x007fe4ca1defc8 ...>
#
# pry(main)> reunion.name
# # => "1406 BE"
#
# pry(main)> reunion.activities
# # => []
#
# pry(main)> activity_1 = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1d9438 ...>
#
# pry(main)> reunion.add_activity(activity_1)
#
# pry(main)> reunion.activities
# # => [#<Activity:0x007fe4ca1d9438 ...>]
# ```
