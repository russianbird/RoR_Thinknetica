module Validation
  def valid?
    validate!
  rescue RuntimeError
    false
  end
end
