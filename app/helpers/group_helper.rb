module GroupHelper
  def get_total_value(group)
    sum = 0
    group.entities.each do |entity|
      sum += entity.amount
    end
    p sum
  end
end
