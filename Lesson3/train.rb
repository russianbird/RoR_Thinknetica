class Train

  attr_accessor :speed
  attr_reader :number, :type, :cars

  def initialize (number, type, cars)
    @number = number
    @type = type
    @cars = cars
    @speed = 0
    @station_index = 0
  end

  def brake
    @speed = 0
  end

  def add_car
    @cars += 1 if @speed == 0
  end

  def remove_car
    @cars -= 1 if @speed == 0
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
    @current_route.station_list[@station_index + 1]
  end

  def previous_station
    @current_route.station_list[@station_index - 1]
  end

  def go_next
    current_station.train_depart(self)
    @station_index += 1
    current_station.train_arrive(self)
  end

  def go_back
    current_station.train_depart(self)
    @station_index -= 1
    current_station.train_arrive(self)
  end
end
