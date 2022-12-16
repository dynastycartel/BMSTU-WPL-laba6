# frozen_string_literal: true

require_relative 'funcs'

int1 = intg(0.1, 1, 1000) { |x| (Math.log(x, Math::E) / x) }

int2 = intg(0, 2, 1000, &->(x) { Math.sin(x) * Math.cos(x) })

puts "the integral value of the function f(x) = ln(x)/x on the interval [0.1, 1] is: #{int1}"

puts "the integral value of the function f(x) = sin(x) * cos(x) on the interval [0, 2] is: #{int2}"
