require_relative './city'
class ManageCSV
  require 'csv'
  require 'json'

  attr_reader :headers, :rows

  def initialize(file = nil)
    @file = file
    @headers, *@rows = CSV.read(@file, headers: true).to_a
  end

  def structs
    rows.map { |row| City.new(Hash[headers.zip(row)]) }
  end
end
