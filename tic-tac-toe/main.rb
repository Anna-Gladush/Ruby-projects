# Table
a = ' 1 | 2 | 3 '
b = '-----------'
c = ' 4 | 5 | 6 '
d = '-----------'
e = ' 7 | 8 | 9 '
f = '-----------'
puts a, b, c, d, e, f
# puts `clear` #will clear the output
a =  a.gsub('1', 'X')
c = c.gsub('6', 'O')
c = c.gsub('4', 'O')
puts c.count('O')
puts a, b, c, d, e, f