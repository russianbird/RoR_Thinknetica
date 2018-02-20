class Action
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def start
    display_menu
    choose_action
  end

  private # а)потому что нет наследников, б)потому что они не вызываются извне

  def display_menu
    puts "What are you gonna do now?"
    puts "Push 1 to make a station"
    puts "Push 2 to make a passenger train"
    puts "Push 3 to make a cargo train"
    puts "Push 4 to build a new route"
    puts "Push 5 to add station to the route"
    puts "Push 6 to remove station from the route"
    puts "Push 7 to set up a route"
    puts "Push 8 to add cars"
    puts "Push 9 to remove cars"
    puts "Push 10 to move a train to the next station"
    puts "Push 11 to move a train to the previous station"
    puts "Push 12 to display stations and trains lists"
    puts "Push 13 for exit"
  end

  def choose_action
    loop do
      puts "Choose 1-13 for action or 0 for menu"
      choice = gets.chomp
      case choice
        when "0" then display_menu
        when "1" then make_station
        when "2" then make_passenger_train
        when "3" then make_cargo_train
        when "4" then build_route
        when "5" then expand_route
        when "6" then reduce_route
        when "7" then join_route
        when "8" then add_train_cars
        when "9" then remove_train_cars
        when "10" then move_forward
        when "11" then move_backward
        when "12" then display_stations_trains_list
        when "13" then exit
      end
    end
  end

  def make_station
    puts "Name the station"
    name = gets.chomp
    @stations << Station.new(name)
    puts "Here is the new station - #{name}."
  end

  def all_stations
    @stations.each.with_index(1) {|station, index| puts "#{index} - #{station.name}"}
  end

  def make_passenger_train
    puts "Set up a train number. "
    number = gets.chomp
    @trains << PassengerTrain.new(number, type = "Passenger")
    puts "#{type} train No #{number} is ready to go!"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def make_cargo_train
    puts "Set up a train number"
    number = gets.chomp
    @trains << CargoTrain.new(number, type = "Cargo")
    puts "#{type} train No #{number} is ready to go!"
  end

  def build_route
    all_stations
    puts "Choose the first station index"
    first = @stations[gets.to_i - 1]
    puts "Choose the last station index"
    last = @stations[gets.to_i - 1]
    route = Route.new(first, last)
    @routes << route
    puts "Route #{route.name} is builded"
  end

  def all_routes
    @routes.each.with_index(1) {|route, index| puts "#{index} - #{route.name}"}
  end

  def route_choice
    all_routes
    puts "Choose the route index"
    route = @routes[gets.to_i - 1]
  end

  def station_choice
    all_stations
    puts "Choose the station index"
    station = @stations[gets.to_i - 1]
  end

  def expand_route
    route = route_choice
    station = station_choice
    route.add_station(station)
    puts "#{station.name} added!"
    puts route.name
  end

  def reduce_route
    route = route_choice
    station = station_choice
    route.remove_station(station)
    puts "#{station.name} removed!"
    puts route.name
  end

  def all_trains
    @trains.each.with_index(1) {|train, index| puts "#{index} - #{train}"}
  end

  def train_choice
    all_trains
    puts "Choose the train index"
    @trains[gets.to_i - 1]
  end

  def join_route
    train = train_choice
    route = route_choice
    train.add_route(route)
    puts "Train #{train} joined the route #{route.name}"
  end

  def add_train_cars
    train = train_choice
    if train.class == CargoTrain
      train.add_car(CargoCar.new)
    else
      train.add_car(PassengerCar.new)
    end
    puts "One car was added to train No #{train}"
  end

  def remove_train_cars
    train = train_choice
    train.remove_car
    puts "One car was removed from train No #{train}"
  end

  def move_forward
    train = train_choice
    train.go_next
    puts "Train No #{train} is at the #{train.current_station} station"
  end

  def move_backward
    train = train_choice
    train.go_back
    puts "Train No #{train} is at the #{train.current_station} station"
  end

  def display_stations_trains_list
    station = station_choice
    puts station.train_list
  end
end
