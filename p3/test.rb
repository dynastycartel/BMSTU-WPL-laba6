# frozen_string_literal: true

require_relative 'funcs'
require 'minitest/autorun'

# inherits default test class
class TestFunc < Minitest::Test
  def setup; end

  def test_proc_given_root_exists
    assert_in_delta(-2.65095, intg(0.1, 1, 1000) { |x| (Math.log(x, Math::E) / x) }, 0.02)
  end

  def test_lambda_given_root_exists
    assert_in_delta(0.41341, intg(0, 2, 1000, &->(x) { Math.sin(x) * Math.cos(x) }), 0.001)
  end

  def test_func_equality
    assert_equal intg(0.1, 1, 1000) { |x| (Math.log(x, Math::E) / x) }, intg(0.1, 1, 1000, &lambda { |x|
                                                                                              Math.log(x, Math::E) / x
                                                                                            })
  end
end
