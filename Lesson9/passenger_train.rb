class PassengerTrain < Train
  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, "Passenger")
  end

  private

  def right_type?(car)
    car.is_a?(PassengerCar)
  end
end
