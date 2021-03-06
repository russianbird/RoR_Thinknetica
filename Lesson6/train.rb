require_relative 'producing_company'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include ProducingCompany
  include InstanceCounter
  include Validation

  attr_reader :speed, :number, :cars_list

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i
  TYPES = ["Cargo", "Passenger"]

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
    if @speed == 0 && right_type?(car)
      @cars_list << car
    else
      puts "You should stop first or check another car"
    end
  end

  def remove_car
    if @speed == 0 && !@cars_list.empty?
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

  protected

  def validate!
    raise "Number can't be nil" if number.nil?
    raise "Number should be at least 5 symbols" if number.length < 5
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
    raise 'Numbers cannot be duplicated' unless @@trains[number].nil?
    raise "Invalid train type" unless TYPES.include(@type)

    end
    true
  end
end
