require "minitest/autorun"
require 'json'
require_relative '../neighbor.rb'

class TestNeighbor< Minitest::Test
  def setup
    @neighbor = Neighbor.new({ name: 'El Trapiche', habitans: '11' })
  end

  def test_that_to_h_method_returns_a_hash
    assert_equal(@neighbor.to_h.class, Hash)
  end

  def test_that_to_h_method_returns_a_well_frommed_hash
    assert_equal(@neighbor.to_h[:name], 'El Trapiche')
  end
end

