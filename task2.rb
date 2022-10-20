print "Input A: "
a = gets.chomp.to_f

print "Input B: "
b = gets.chomp.to_f

print "Input C: "
c = gets.chomp.to_f

print "Input X_start: "
x_start = gets.chomp.to_f

print "Input X_end: "
x_end = gets.chomp.to_f

print "Input D_x: "
d_x = gets.chomp.to_f

puts "\n-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"

def F(x, a, b, c)

  res = 0
  if (c < 0 && x != 0)
    res = - a*x - c
  elsif (c > 0 && x == 0)
    res = (x - a) / - c
  else
    res = (b * x) / c - a
  end

  res.truncate! if (a.truncate || b.truncate || c.truncate) == 0
  return res
end

def inter_F(a, b, c, x_start, x_end, d_x)
  x_ = []
  f_ = []

  x = x_start
  while x < x_end
    x_.push(x)
    f_.push(F(x, a, b, c))
    x += d_x
  end

  return x_, f_
end

x_, f_ = inter_F(a, b, c, x_start, x_end, d_x)

puts "\n+_+_+_+_"
puts "|--  x            --|--             f  --|"
x_.length.times { |n|
  puts "*********************************************************"
  puts "|--  #{x_[n]}            --|--             #{f_[n]}  --|"
}
