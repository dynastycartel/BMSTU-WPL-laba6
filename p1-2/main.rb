# frozen_string_literal: true

require_relative 'funcs'

def calculate1(eps)
  sum, iterations = sum_method1(eps)
  puts "Epsilon = #{eps}\nCurve length: #{sum}\nNumber of iterations: #{iterations}"
end

def calculate2(eps)
  sum, iterations = sum_method2(eps)
  puts "Epsilon = #{eps}\nCurve length: #{sum}\nNumber of iterations: #{iterations}"
end

puts '------------------Method 1------------------'
calculate1(10**-3)
puts "\n"
calculate1(10**-2)

puts "\n"

puts '------------------Method 2------------------'
calculate2(10**-3)
puts "\n"
calculate2(10**-2)
