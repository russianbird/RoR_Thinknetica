class PassengerCar < Car
  def take_space(space = 1)
    super(space) unless @free_space.zero?
  end
end
