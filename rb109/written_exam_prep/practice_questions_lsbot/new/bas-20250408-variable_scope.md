Question 1: Variable Scope (Basic)
What will the following code output? Explain why.
# ruby

a = 7

def my_method
  a = 5
  puts a
end

my_method
puts a