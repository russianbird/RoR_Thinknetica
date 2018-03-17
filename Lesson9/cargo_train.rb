class CargoTrain < Train
  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, "Cargo")
  end

  private

  def check_type(car)
    car.is_a?(CargoCar)
  end
end
