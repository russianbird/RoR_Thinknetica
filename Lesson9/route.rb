require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Route
  include InstanceCounter
  include Validation
  include Accessors

  validate :name, :presence

  attr_reader :name, :station_list

  def initialize(first, last)
    @station_list = [first, last]
    @name = first.name + "––" + last.name
    validate!
    register_instance
  end

  def add_station(station)
    @station_list.insert(1, station)
  end

  def remove_station(station)
    @station_list.delete(station) if @station_list[1..-2].include?(station)
  end
end
