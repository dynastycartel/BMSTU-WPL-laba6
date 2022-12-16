# frozen_string_literal: true

def dist(point1, point2)
  ((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)**(1.0 / 2)
end

def sum_method1(eps)
  ideal = 9.073415289388
  res = 0
  num_otr = 1
  while (ideal - res).abs >= eps
    num_otr *= 10
    res = 0
    step = 4.0 / num_otr
    x = 0
    p_prev = [0, 0]
    (1..num_otr).each do |_i|
      x += step
      p_curr = [x, get_elem(x)]
      res += dist(p_prev, p_curr)
      p_prev = p_curr.dup
    end
  end
  [res, num_otr]
end

def get_elem(cur_x)
  cur_x**(3.0 / 2)
end

def elements_generator
  Enumerator.new do |y|
    num_otr = 1
    loop do
      num_otr *= 10
      res = 0
      step = 4.0 / num_otr
      cur_x = 0
      p_prev = [0, 0]
      (1..num_otr).each do |_i|
        cur_x += step
        p_curr = [cur_x, get_elem(cur_x)]
        res += dist(p_prev, p_curr)
        p_prev = p_curr.dup
      end
      y << [res, num_otr]
    end
  end
end

def sum_method2(eps)
  ideal = 9.073415289388
  elements_generator.find { |res| (ideal - res[0]).abs <= eps }
end
