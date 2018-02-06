require_relative "station"
require_relative "route"
require_relative "train"
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'

action = Action.new
action.display_menu
action.choose_action
