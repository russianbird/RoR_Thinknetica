require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :train_list

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    register_instance
    @name = name
    @train_list = []
    @@stations << self
  end

  def train_arrive(train)
    @train_list << train
  end

  def train_depart(train)
    @train_list.delete(train)
  end

  def count_type(type)
    @train_list.count {|train| train.type == type}
  end
end
