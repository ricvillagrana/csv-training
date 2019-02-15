require "minitest/autorun"
require 'json'
require_relative '../city.rb'

class TestCity < Minitest::Test
  def setup
    @city             = City.new({ city: 'Colima', state: 'Colima', neighborhoods: [{"name" =>  "El trapiche", "habitans" => "3000"}] })
    @city_with_string = City.new({ city: 'Colima', state: 'Colima', neighborhoods: '[{"name": "El trapiche", "habitans": "3000"}]' })
  end

  def test_that_city_is_correct
    assert_equal(@city.city, 'Colima')
  end

  def test_when_neighborhoods_is_a_string_it_is_parsed
    assert_equal(@city_with_string.neighborhoods.class, Array)
  end

  def test_that_passing_neighborhoods_as_string_is_equal_than_passing_a_array
    assert_equal(@city_with_string.neighborhoods.first.name, @city.neighborhoods.first.name)
  end

  def test_that_neighborhoods_items_are_neighbor_class
    assert_equal(@city.neighborhoods.first.class, Neighbor)
  end

end

