require_relative 'producing_company'
require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Train
  include ProducingCompany
  include InstanceCounter
  include Validation
  include Accessors

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  attr_reader :speed, :number, :cars_list

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, NUMBER_FORMAT

  @@trains = {}

  def self.find
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @cars_list = []
    @speed = 0
    @station_index = 0
    @@trains[number] = self
    register_instance
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed > 9 ? @speed -= 10 : @speed
  end

  def brake
    @speed = 0
  end

  def add_car(car)
    if @speed.zero? && right_type?(car)
      @cars_list << car
    else
      puts "You should stop first or check another car"
    end
  end

  def remove_car
    if @speed.zero? && !@cars_list.empty?
      @cars_list.pop
    else
      puts "You don't have enough cars or your speed is too high."
    end
  end

  def add_route(route)
    @current_route = route
    @station_index = 0
    current_station.train_arrive(self)
  end

  def current_station
    @current_route.station_list[@station_index]
  end

  def next_station
    if current_station != @current_route.station_list.last
      @current_route.station_list[@station_index + 1]
    else
      puts 'There is nothing ahead'
    end
  end

  def previous_station
    if current_station != @current_route.station_list.first
      @current_route.station_list[@station_index - 1]
    else
      puts 'There is nothing behind'
    end
  end

  def go_next
    if current_station != @current_route.station_list.last
      current_station.train_depart(self)
      @station_index += 1
      current_station.train_arrive(self)
    else
      current_station
    end
  end

  def go_back
    if current_station != @current_route.station_list.first
      current_station.train_depart(self)
      @station_index -= 1
      current_station.train_arrive(self)
    else
      current_station
    end
  end

  def each_car
    @cars_list.each { |car| yield(car) } if block_given?
  end
end
