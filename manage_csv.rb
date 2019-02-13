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

  def append(city)
    CSV.open(@file, 'wb') do |csv|
      @rows << match_headers(city)
      csv << @headers
      @rows.each { |row| csv << row }
    end if city.is_a?(City)
  end

  private

  def match_headers(city)
    @headers.map(&:snakecase).map do |header|
      data = city.send(header)
      data.is_a?(Array) ? JSON.generate(data.map(&:to_h)) : data
    end
  end
end
