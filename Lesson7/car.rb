require_relative "producing_company"

class Car
  include ProducingCompany

  @@wagon_number = 0

  attr_reader :all_space, :free_space, :number

  def initialize(space)
    @all_space = space
    @free_space = space
    @number = @@wagon_number += 1
  end

  def take_space(space)
    @free_space -= space
  end

  def purchased_space
    @all_space - @free_space
  end
end
