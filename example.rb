def add_name(names, name)
  names << name
  name.upcase!
end

names = ['bob', 'kim']
name = 'jim'
add_name(names, name)

puts name
puts names