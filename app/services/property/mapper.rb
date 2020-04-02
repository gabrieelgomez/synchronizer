class Property::Mapper
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def id
    @object[:id]
  end

  def title
    @object[:title]
  end

  def external_id
    @object[:id]
  end

  def description
    @object[:description]
  end

  def type
    @object[:property_type]
  end

  def bedrooms
    @object[:bedrooms].to_i
  end

  def bathrooms
    @object[:bathrooms].to_i
  end

  def parking_spaces
    @object[:parking_spaces].to_i
  end

  def agent
    @object[:agent]
  end

  def rental
    @object[:operation][:type] == 'rental'
  end

  def sale
    @object[:operation][:type] == 'sale'
  end

  def prices
    prices = @object[:operation][:price]
    prices.is_a?(Hash) ? [prices] : prices
  end

  def currency
    return nil if prices.nil?
    prices.map{|x| x[:currency]}.uniq[0]
  end

  def get_amounts(currency_id)
    return nil if prices.nil?
    prices.map{|x| {price: x[:amount]&.to_f, period: x[:period], currency_id: currency_id}}
  end

  def features
    @object[:features]
  end

  def images
    @object[:images]
  end

end
