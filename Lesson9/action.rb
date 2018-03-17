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

  private

  def display_menu
    [
      "Push 1 to make a station", "Push 2 to make a passenger train",
      "Push 3 to make a cargo train", "Push 4 to build a new route",
      "Push 5 to add station to the route", "Push 6 to remove station from the route",
      "Push 7 to set up a route", "Push 8 to add cars", "Push 9 to remove cars",
      "Push 10 to move a train to the next station",
      "Push 11 to move a train to the previous station",
      "Push 12 to display stations and trains lists",
      "Push 13 to buy ticket or capacity",
      "Push 14 to display all available stations, trains and cars", "Push 15 for exit"
    ].each { |action| puts action }
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
      when "12" then display_station_trains
      when "13" then use_car_space
      when "14" then display_stations_trains_cars
      when "15" then exit
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
    @stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def make_passenger_train
    puts "Set up a train number. "
    number = gets.chomp
    @trains << PassengerTrain.new(number)
    puts "Passenger train No #{number} is ready to go!"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def make_cargo_train
    puts "Set up a train number"
    number = gets.chomp
    @trains << CargoTrain.new(number)
    puts "Cargo train No #{number} is ready to go!"
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def build_route
    all_stations
    route = Route.new(choose_first, choose_last)
    @routes << route
    puts "Route #{route.name} is builded"
  end

  def choose_first
    puts "Choose the first station index"
    @stations[gets.to_i - 1]
  end

  def choose_last
    puts "Choose the last station index"
    @stations[gets.to_i - 1]
  end

  def all_routes
    @routes.each.with_index(1) { |route, index| puts "#{index} - #{route.name}" }
  end

  def route_choice
    all_routes
    puts "Choose the route index"
    @routes[gets.to_i - 1]
  end

  def station_choice
    all_stations
    puts "Choose the station index"
    @stations[gets.to_i - 1]
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
    @trains.each.with_index(1) { |train, index| puts "#{index} - #{train}" }
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
    print "Input amount of sits for a passenger car or capacity for a cargo car:"
    space = gets.to_i
    if train.class == CargoTrain
      train.add_car(CargoCar.new(space))
      puts "Cargo car with #{space} capacity was added to train No #{train}"
    else
      train.add_car(PassengerCar.new(space))
      puts "Passenger car with #{space} sits was added to train No #{train}"
    end
  end

  def use_car_space
    choose_car
    car = train.cars_list[gets.to_i - 1]
    if car.is_a?(PassengerCar)
      purchase_ticket
    else
      purchase_cargo_space
    end
  end

  def choose_car
    train = train_choice
    puts "#{train.class} No #{train.number} has #{train.cars_list.size} cars."
    print "Choose a car 1 upto #{train.cars_list.size}: "
  end

  def purchase_ticket
    puts "Passenger car No #{car.number}. Amount of free sits: #{car.free_space}."
    puts ":::::: PURCHASING TICKET ::::::"
    car.take_space
    puts "#{car.free_space} sits are available for purchasing."
  end

  def purchase_cargo_space
    puts "Cargo car No #{car.number}. Space available for purchasing: #{car.free_space}."
    print "How many units of space you want to purchase? "
    puts ":::::: PURCHASING SPACE ::::::"
    car.take_space(gets.to_i)
    puts "#{car.free_space} units of space are available for purchasing."
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

  def display_station_trains
    station = station_choice
    station.trains.each do |train|
      puts "#{train.number} – #{train.class} – #{train.cars_list.size}"
    end
  end

  def display_stations_trains_cars
    @stations.each do |station|
      puts "#{station.name}: "
      station.each_train do |train|
        puts "#{train.number} – #{train.class} – #{train.cars_list.size}"
        train.each_car do |car|
          puts "#{car.number} – #{car.class} – #{car.free_space} – #{car.purchased_space}"
        end
      end
    end
  end
end
