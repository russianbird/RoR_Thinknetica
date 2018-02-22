require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

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

  private

  def validate!
    unless @stations.first.is_a?(Station) && @stations.last.is_a?(Station)
      raise "Choose a Station class object."
    end
    true
  end
end
