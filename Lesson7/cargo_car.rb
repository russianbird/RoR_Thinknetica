class CargoCar < Car
  def take_space(capacity)
    rest_space = @free_space - capacity
    @free_space -= capacity if rest_space >= 0
  end
end
