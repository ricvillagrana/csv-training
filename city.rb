require 'snake_camel'
require_relative './neighbor'

City = Class.new do
  def initialize(attrs)
    attrs.each do |key, value|
      self.class.send(:attr_accessor, key.snakecase)
      self.instance_variable_set("@#{key.snakecase}", value)
    end
    parse_neighborhoods(@neighborhoods)
  end

  def parse_neighborhoods(data)
    arr = JSON.parse(data) if data.is_a?(String)
    @neighborhoods = arr.nil? ? [] : arr.map do |neighbor|
      Neighbor.new(neighbor)
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

