require_relative 'manage_csv'

manager = ManageCSV.new('./cities.csv')
structs = manager.structs

neighbors = -> (city) { city.neighborhoods.map(&:name) }

puts neighbors.call(structs.first)

