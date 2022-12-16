# frozen_string_literal: true

def intg(a, b, n)
  step = (b * 1.0 - a) / n
  s = 0
  x = a + step
  while x <= b
    s += yield(x)
    x += step
  end
  s * step
end
