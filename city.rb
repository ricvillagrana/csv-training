require 'snake_camel'
require_relative './neighbor'

#class City
  #def initialize(attrs)
    #attrs.each do |key, value|
      #self.instance_variable_set("@#{key.snakecase}", value)
      #self.class.send(:attr_accessor, key.snakecase)
    #end
    #neighborhoods = JSON.parse(@neighborhoods)
    #@neighborhoods = neighborhoods.map { |neighbor| Neighbor.new(neighbor) }
  #end
#end

City = Class.new do
  def initialize(attrs)
    attrs.each do |key, value|
      self.class.send(:attr_accessor, key.snakecase)
      self.instance_variable_set("@#{key.snakecase}", value)
    end
    neighborhoods = JSON.parse(@neighborhoods)
    @neighborhoods = neighborhoods.map { |neighbor| Neighbor.new(neighbor) }
  end
end

