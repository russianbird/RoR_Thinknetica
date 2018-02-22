class CargoTrain < Train
  def initialize(number)
    super(number, "Cargo")
  end

  private

  def check_type(car)
    car.is_a?(CargoCar)
  end
end
