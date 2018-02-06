class PassengerTrain < Train
  def check_type(car)
    car.is_a?(PassengerCar)
  end
end
