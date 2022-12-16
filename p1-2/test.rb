# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'funcs'

# inherits default test class
class SequenceSumTest < Minitest::Test
  def test_epsilon1000
    eps = 10**-3
    assert_in_delta 9.073415289388, sum_method2(eps)[0], 0.001
  end

  def test_epsilon100
    eps = 10**-2
    assert_in_delta 9.073415289388, sum_method2(eps)[0], 0.01
  end

  def test_func_equality
    eps = 10**-2
    assert_equal sum_method1(eps)[0], sum_method2(eps)[0]
    eps = 10**-3
    assert_equal sum_method1(eps)[0], sum_method2(eps)[0]
  end
end
