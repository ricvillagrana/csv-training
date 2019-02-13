Neighbor = Class.new do
  def initialize(attrs)
    attrs.each do |key, value|
      self.class.send(:attr_accessor, key.snakecase)
      self.instance_variable_set("@#{key.snakecase}", /\d+/.match(value.to_s) ? value.to_i : value)
    end
  end

  def to_h
    headers = self.instance_variables.map { |v| v.to_s[1..-1] }
    Hash[headers.zip(headers.map { |h| self.send(h) })]
  end
end

