class PassengerTrain < Train
  def initialize(number)
    @type = "Passenger"
    super(number, @type)
  end

  private

  def right_type?(car)
    car.is_a?(PassengerCar)
  end
end
