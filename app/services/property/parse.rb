class Property::Parse < Ox::Sax
  attr :root

  def initialize
    @stack = [@node = @root = {}]
  end

  def attr(key, val)
    @node[key] = val
  end

  def end_element(key)
    child = @stack.pop
    @node = @stack.last

    case @node[key]
      when Array
        @node[key] << child
      when Hash
        @node[key] = [@node[key], child]
      else
        if child.keys == [:__content__]
          @node[key] = child[:__content__]
        else
          @node[key] = child
        end
    end
    if @node.keys.include?(:properties)
      properties = @node.dig(:properties, :property)
      p "Processing #{properties.size} properties"
      properties.each do |property|
        next unless property.is_a?(Hash)
        Property::Setter.set(property)
      end
    end
  end

  def start_element(key)
    @stack << @node = {}
  end

  def text(val)
    @node[:__content__] = val
  end

  def cdata(val)
    @node[:__content__] = val
  end

end
