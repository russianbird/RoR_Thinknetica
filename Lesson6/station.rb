require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :train_list

  NAME_FORMAT = /^[a-z]{2}-?[a-z]+$/i

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    validate!
    register_instance
    @name = name
    @train_list = []
    @@stations << self
  end

  def valid?
    validate!
  rescue
    false
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
    raise "Name should be at least 3 symbols" if number.length < 3
    raise "Name has invalid format" if name !~ NAME_FORMAT
    true
  end
end
