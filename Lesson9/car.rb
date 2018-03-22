require_relative "producing_company"
require_relative "accessors"
require_relative "train"

class Car
  include ProducingCompany
  include Accessors

  # @@car_number = 0

  attr_reader :all_space, :free_space

  strong_attr_accessor :number, Integer

  def initialize(space, number)
    @all_space = space
    @free_space = space
    # @number = @@car_number += 1
    self.number = number
  end

  def take_space(space)
    @free_space -= space if @free_space >= space
  end

  def purchased_space
    @all_space - @free_space
  end
end
