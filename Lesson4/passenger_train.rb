class PassengerTrain < Train
  def right_type?(car)
    car.is_a?(PassengerCar)
  end
end
