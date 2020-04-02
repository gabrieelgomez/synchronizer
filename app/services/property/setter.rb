class Property::Setter

  def self.set(property)
    new(property).perform
  end

  def initialize(property)
    @getter = Property::Getter.new(property)
  end

  def perform
    property.published = true if property.valid?
    property
    # return property if property.save
  end

  private

  def property
    @property ||= @getter.property
  end
end
