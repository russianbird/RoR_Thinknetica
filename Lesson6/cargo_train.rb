class CargoTrain < Train
  private

  def check_type(car)
    car.is_a?(CargoCar)
  end
end
