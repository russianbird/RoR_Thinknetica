require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :train_list

  NAME_FORMAT = /^[a-z]{2}-?[a-z]+$/i

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @train_list = []
    @@stations << self
    validate!
    register_instance
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

  private

  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name should be at least 3 symbols" if name.length < 3
    raise "Name has invalid format" if name !~ NAME_FORMAT
    true
  end
end
