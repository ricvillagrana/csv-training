require_relative './city'
class ManageCSV
  require 'csv'
  require 'json'

  attr_reader :headers, :rows

  def initialize(file = nil)
    @file = file
    begin
      raise 'The file does not exist.' unless File.exist?(@file)
      @headers, *@rows = CSV.read(@file, headers: true).to_a
    rescue Exception => error
      puts error
      @file = nil
    end
  end

  def structs
    begin
      raise 'File not found, please set a valid file' if @file.nil?
      rows.map { |row| City.new(Hash[headers.zip(row)]) }
    rescue Exception => error
      puts error
    end
  end

  def append(city)
    puts 'File not found, you cannot append to nil file'; return if @file.nil?
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
