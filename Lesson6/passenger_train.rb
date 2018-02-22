class PassengerTrain < Train
  def initialize(number)
    super(number, "Passenger")
  end

  private

  def right_type?(car)
    car.is_a?(PassengerCar)
  end
end
