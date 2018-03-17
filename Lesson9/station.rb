require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Station
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :name, :train_list

  validate :name, :presence

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @train_list = []
    @@stations << self
    register_instance
  end

  def train_arrive(train)
    @train_list << train
  end

  def train_depart(train)
    @train_list.delete(train)
  end

  def count_type(type)
    @train_list.count { |train| train.type == type }
  end

  def each_train
    @train_list.each { |train| yield(train) } if block_given?
  end
end
