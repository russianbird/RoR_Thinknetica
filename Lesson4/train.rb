class Train
  attr_reader :speed, :number, :cars_list

  def initialize(number, type)
    @number = number
    @type = type
    @cars_list = []
    @speed = 0
    @station_index = 0
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed > 9 ? @speed -= 10 : @speed

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
end
