class Route

  attr_reader :station_list

  def initialize(first, last)
    @station_list = [first, last]
  end

  def add_station(station)
    @station_list.insert(1, station)
  end

  def remove_station(station)
    @station_list.delete(station) if @station_list[1..-2].include?(station)
  end
end
