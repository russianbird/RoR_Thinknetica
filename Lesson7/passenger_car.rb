class PassengerCar < Car
  def take_space
    @free_space -= 1 unless @free_space.zero?
  end
end
