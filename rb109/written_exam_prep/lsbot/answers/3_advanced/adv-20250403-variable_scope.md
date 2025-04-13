# 4. Advanced: Explain what the concept of "variable scope" means in Ruby. Illustrate your explanation with examples of local variable scope within methods, blocks, and conditionals.

Variable scope refers to where a variable is accessible in a program. "Local" pertains to the fact that variables may have a limited scope i.e. they are only visible in limited parts of the program.

Local variable scope in method definitions are self-contained: variables initialised inside of a method definition cannot be accessed by outer code, and variables initialised outside of a method definition cannot be accessed from within a method unless they are passed as arguments during execution of a method call.

```ruby
def greeting
  name = "Ruby"
  "Hello, #{name}!"
end

puts greeting # "Hello, Ruby!"
puts name # Error - outer code cannot access `name` which was initialised in the method definition
```

The above example will throw an error because the variable `name` was initialised in the method definition and therefore cannot be accessed by the outer code. Meanwhile, the example below shows how a variable in the outer code can be accessed from within a method definition when an argument is passed in a method invocation.

```ruby
def greeting(name)
  "Hello, #{name}!"
end

person = "Ruby"
puts greeting(person) # greeting method is called and reference to string object "Ruby" passed as argument
                      # `person` variable is accessible to method when argument is passed in
```

Blocks are pieces of code that follow a method invocation and create a new scope. The local variable scope in relation to blocks have the following rules: variables initialised outisde of a block are accessible from within the block, however variables initialised inside of a block are not accessible by outer code.

```ruby
name = "Ruby"

10.times do
  person = "Cat"
  puts "Hello #{name}!" # block can access variable initialised outside of block
end

puts person # Error - outer code cannot access `person` which was initiliased within the block
```

In peer blocks, the variable scoping rules remain the same, with the additional rule that peer blocks cannot access other blocks' variables.

```ruby
name = "Ruby"

loop do
  person = "Cat"
  puts "Hello #{name}! Hello #{person}!" # can access variable in outer code
  break
end

1.times do |i|
  puts "Hello #{name}!"
  puts "Hello #{person}!" # error - cannot access variable in peer block
end

puts person # error - outer code cannot access variable in block
```

In nested blocks, the innermost block can access variables initialised outside of the block in the outermost code, or the code in which it is nested; the 'second-level' block can only access variables initialised within its own level or the outermost code; the top-level or outer code cannot access any variables initialised in the blocks.

```ruby
name = "Ruby" # first-level scope

loop do
  person = "Cat" # second=level scope
  puts "Hello #{name}!" # second-level can access outer code variables
    1.times do
      secret = "I'm a secret"
      puts "Hello #{person}, hello #{name}"
    end

  puts secret # error - cannot access variables in nested block
  break
end

puts person # error
puts secret # error
```

Conditional statements do NOT create a new scope for local variables. This means that variables initialised outside of the conditional can be accessed from within a conditional statement, and vice versa (variables initialised within conditionals can be accessed outside of it).

```ruby
x = 1
y = 3

if y > x
  message = "outer code can access variables initialised from within conditional statements"
  puts "conditionals can use variables initialised from the outside!"
end

puts message # outer code can access variables initialised from within conditional statements
```