class Paginator

  attr_reader :collection, :original_collection, :per, :page

  def self.paginate(collection, params)
    Paginator.new(collection, params).collection
  end

  def initialize(collection, params)
    @original_collection = collection
    @per = params.fetch(:per, nil)
    @page = params.fetch(:page, nil)
    paginate_collection!
  end

  def paginate
    @collection = original_collection.send(page_method, page).send(per_method, per)
  end

  def paginate_array
    @collection = paginator.paginate_array(original_collection).send(page_method, page).send(per_method, per)
  end

  def paginator
    Kaminari
  end

  private
  def page_method
    :page
  end

  def per_method
    :per
  end

  def paginate_collection!
    if collection_is_array?
      paginate_array
    else
      paginate
    end
  end

  def collection_respond_to_pagination?
    original_collection.respond_to?(page_method) || original_collection.respond_to?(per_method)
  end

  def collection_is_array?
    original_collection.is_a?(Array)
  end
end