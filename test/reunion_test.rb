require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'


class ReunionTest < MiniTest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
  end

  def test_reunion_exists
    assert_instance_of Reunion, @reunion
  end

  def test_reunions_have_attributes
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end

  def test_activities_can_be_added
    assert_equal [], @reunion.activities

    @reunion.add_activity(@activity_1)

    assert_equal [@activity_1], @reunion.activities
  end

  def test_cost_of_all_all_activities_can_be_retrieved
    @reunion.add_activity(@activity_1)

    assert_equal 60, @reunion.total_cost

    @reunion.add_activity(@activity_2)

    assert_equal 180, @reunion.total_cost
  end

  def test_total_cost_for_entire_reunion_can_be_retrieved
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    
    assert_equal ({"Maria" => -10, "Luther" => -30, "Louis" => 40}), @reunion.breakout
  end
end

# pry(main)> reunion.summary
# # => "Maria: -10\nLuther: -30\nLouis: 40"
#
# pry(main)> puts reunion.summary
# Maria: -10
# Luther: -30
# Louis: 40
