class SearchModel

  def initialize(id:, type:)
    @type = sanitanize(type)
    @id = id.to_i
    @model = return_model
  end

  def return_model
    @type.constantize.find(@id)
  rescue NameError
    nil
  end

  def model
    @model
  end

  private

  def sanitanize(type)
    raise "QUEDA PENDIENTE ESTO" unless type.is_a?(String)
    type.capitalize.singularize
  end

end