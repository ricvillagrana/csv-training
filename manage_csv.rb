require_relative './city'
class ManageCSV
  require 'csv'
  require 'json'

  attr_reader :headers, :rows

  def initialize(file = nil)
    @file = file
  end

  def read
    result = CSV.read(@file, headers: true).to_a
    @headers, *@rows = result
  end

  def structs
    rows.map { |row| City.new(Hash[headers.zip(row)]) }
  end
end
