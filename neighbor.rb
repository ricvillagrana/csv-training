Neighbor = Class.new do
  def initialize(attrs)
    attrs.each do |key, value|
      self.class.send(:attr_accessor, key.snakecase)
      self.instance_variable_set("@#{key.snakecase}", /\d+/.match(value) ? value.to_i : value)
    end
  end

  def to_a
    self.instance_variables.map do |v|
      v.to_s[1..-1]
    end.map do |variable|
      self.send(variable)
    end
  end
end

