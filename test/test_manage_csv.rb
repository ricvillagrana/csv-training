require "minitest/autorun"
require 'json'
require_relative '../manage_csv.rb'

class TestManageCSV< Minitest::Test
  def setup
    @wrong_path_instance = ManageCSV.new('./cities.csvv')
    @manager = ManageCSV.new('./cities.csv')
    @structs = @manager.structs
    @correct_file = 'cities.csv'
  end

  def test_that_file_is_empty_when_file_path_is_wrong
    assert_nil(@wrong_path_instance.file)
  end

  def test_that_file_can_be_fetched_after_file_path_is_correct
    @wrong_path_instance.file = @correct_file
    @wrong_path_instance.fetch_file
    assert_equal(@wrong_path_instance.file, @correct_file)
    assert_instance_of(Array, @wrong_path_instance.structs.first.neighborhoods)
  end

  def test_that_file_cannot_be_fetched_after_file_path_is_incorrect
    @wrong_path_instance.file = @correct_file + 'another string to mess up'
    @wrong_path_instance.fetch_file
    assert_nil(@wrong_path_instance.file)
  end

  def test_that_structs_are_class_of_city
    assert(@structs.all? { |s| s.class == City })
  end

  def test_append_a_new_city
    city = City.new({ city: 'Colima', state: 'Colima' })
    assert(@manager.append(city))
  end

  def test_append_a_new_city_with_errors
    city = { city: 'Colima', state: 'Colima' }
    assert_nil(@manager.append(city))
  end

end

