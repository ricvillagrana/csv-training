require_relative 'manage_csv'

manager = ManageCSV.new('./cities.csv')

manager.read

structs = manager.structs

p structs
#proc neighbors = -> (city) { city.neighborhoods }

#puts neighbors(structs.first)

