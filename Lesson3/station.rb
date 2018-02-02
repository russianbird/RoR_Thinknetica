class Station

  attr_reader :name, :train_list

  def initialize(name)
    @name = name
    @train_list = []
  end

  def train_arrive(train)
    @train_list << train
  end

  def train_depart(train)
    @train_list.delete(train)
  end
end
