class Property::Getter
  attr_reader :object, :property

  def initialize(object)
    @object = Property::Mapper.new(object)
    find_and_initialize
    set_currency
    set_operation
    set_property_type
    find_or_create_user
  end

  private

  def find_and_initialize
    @property                = Property.find_or_initialize_by(external_id: @object.id)
    @property.title          = @object.title
    @property.description    = @object.description
    @property.bedrooms       = @object.bedrooms
    @property.bathrooms      = @object.bathrooms
    @property.parking_spaces = @object.parking_spaces
    @property.features       = @object.features
    @property.images         = @object.images
  end

  def set_currency
    @property.currency = Currency.find_or_create_by(code: @object.currency)
  end

  def set_operation
    if @object.rental
      @property.rental = @object.rental
    elsif @object.sale
      @property.sale   = @object.sale
    end
    @property.amounts.new(@object.get_amounts(@property.currency_id))
  end

  def set_property_type
    @property.property_type = PropertyType.find_by(name: @object.type)
  end

  def find_or_create_user
    return if @object.agent.nil?
    @property.user = User.find_or_create_by(email: @object.agent[:email]) do |user|
      user.first_name = @object.agent[:name].split.first
      user.last_name  = @object.agent[:name].split.last
      user.phone      = @object.agent[:cell]
    end
  end
end
