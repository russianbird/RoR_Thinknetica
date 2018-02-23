class CargoCar < Car
  def take_space(space)
    super(space) if @free_space >= space
  end
end
