class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    reunion_owed = @activities.map do |activity|
      activity.owed
    end
    reunion_owed.reduce({}) do |sums, location|
      sums.merge(location) do |_, a, b|
        a + b
      end
    end
  end
end
