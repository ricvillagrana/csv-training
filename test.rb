require_relative 'manage_csv'

manager = ManageCSV.new('./cities.csv')
structs = manager.structs

neighbors = -> (city) { city.neighborhoods.map(&:name) }

neighbors_habitants = -> (city) do
  city.neighborhoods.map(&:habitans).reduce do |acc = 0, habitans|
    acc + habitans
  end
end

has_as_neighbor = -> (city_name) do
  structs.select { |struct| struct.neighborhoods.any? { |n| n.name == city_name } }
end

puts neighbors.call(structs.first)

puts neighbors_habitants.call(structs[23])

puts 'Cities that has Hills as neighbor'
puts has_as_neighbor.call('Hills').map { |city| "#{city.city}, #{city.state}" }

