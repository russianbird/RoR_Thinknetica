class CargoTrain < Train
  def initialize(number)
    @type = "Cargo"
    super(number, @type)
  end

  private

  def check_type(car)
    car.is_a?(CargoCar)
  end
end
