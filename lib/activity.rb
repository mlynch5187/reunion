class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.values.length
  end

  def owed
    @participants.reduce({}) do |result, participant_cost|
      result[participant_cost[0]] = split - participant_cost[1]
      result
    end
  end
end
