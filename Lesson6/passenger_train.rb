class PassengerTrain < Train
  private

  def right_type?(car)
    car.is_a?(PassengerCar)
  end
end
