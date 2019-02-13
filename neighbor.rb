#class Neighbor
  #def initialize(attrs)
    #attrs.each do |key, value|
      #self.instance_variable_set("@#{key.snakecase}", /\d+/.match(value) ? value.to_i : value)
      #self.class.send(:attr_accessor, key.snakecase)
    #end
  #end
#end

Neighbor = Class.new do
  def initialize(attrs)
    attrs.each do |key, value|
      self.class.send(:attr_accessor, key.snakecase)
      self.instance_variable_set("@#{key.snakecase}", /\d+/.match(value) ? value.to_i : value)
    end
  end
end

