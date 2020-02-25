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
