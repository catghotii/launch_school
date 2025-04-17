# Assorted Questions from RB101-130 (mostly 101)


What happens if you call sort on an array with multiple data types? What does this code return?

```
[1, 'a'].sort
```

​

a.

```
[1, 'a']
```

​

b.

```
A type error will be thrown
```

c.

```
['a', 1]
```

​

d.

```
An argument error will be thrown
```



2. What does the following code return?

```
[ ['a', 'cat', 'b', 'c'], ['b', 2], ['A', 'car', 'd', 3], ['a', 'car', 'd'] ].sort
```

​

a.

```
It throws an ArgumentError because we can't compare integers and strings.
```

b.

```
[ ["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2] ]
```

​

c.

```
[ ["a", "b", "c", "cat"], ["a", "car", "d"], ["a", "car", "d", 3], ["b", 2] ]
```

​

d.

```
[ ["b", 2], ["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"] ]
```

​

Answer

3. What is output in this code?

```
def remove_evens!(arr) arr.each do |num| if num % 2 == 0 arr.delete(num) end end arr end p remove_evens!([1,1,2,3,4,6,8,9])
```

​

a.

```
[1, 1, 2, 3, 4, 6, 8, 9]
```

​

b.

```
[1, 1, 3, 9]
```

​

c.

```
[1, 1, 3, 6, 9]
```

​

d.

```
[2, 4, 6, 8]
```

​

Answer

4. Demonstrate how to create an instance of the Textbook class.

```
class Book def initialize(args) @pages = args.fetch(:pages) @title = args.fetch(:title) end end class Textbook < Book def initialize(args) @chapters = args.fetch(:chapters) end end
```

​

a.

textbook = Textbook.new({ chapters: 20 })

​

b.

textbook = Textbook.new(chapters = 20)

​

c.

textbok = Textbook.new({ chapters: 20, pages: 260, title: "The Human Brain" })

​

d.

textbook = Textbook.new(20, 260, "The Human Brain")

​

The Textbook class is initialized with a hash that must contain the key :chapters. The Textbook#initialize method overwrites the Book#initialize method, so a Textbook object does not need to be initialized with a hash containing :pages or :title. initialize() is just like any other method that can be overwritten with inheritance

5. Is it appropriate for the Board class to inherit from the Game class?

class Board end class Game end

​

a. Yes, because a Game has a Board

b. No, because a board is not a game, so the "is a" test is not met. When the "is a" test is not met, inheritance should not be used.

c. No, we should use a module instead

d. Yes, because a Board will need access to the same attributes and behaviors as a Game

Answer

6. What does the following code print?

puts :unicorn.reverse

​

a.

:nrocinu

​

b.

"nrocinu"

​

c.

:unicorn

​

d.

An error message

Answer:

7. What does the following code return?

snowy_owl = { "type"=>"Bird", "diet"=>"Carnivore", "life_span"=>"10 years" } snowy_owl.select do |key, value| key == "type" end

​

a.

{"type"=>"Bird"}

​

b.

An error because select is an Array method and won't work for a Hash

c.

"Bird"

​

d.

["type", "Bird"]

​

Answer

8. Given the following code:

personality_types = ["bad", "good", "great"] # omitted code puts personality_types # ["bad person", "good person", "great person"]

​

Which of these lines of code will mutate the personality_types array to this:

["bad person", "good person", "great person"]

​

a.

personality_types.each { |type| type << " person" }

​

b.

personality_types.each {|type| type += ' person'}

​

c.

personality_types.map {|type| type + ' person'}

​

d.

personality_types.map {|type| type += ' person'}

​

Notes: C, D return a new array. A will mutate the caller.

9. What does the following code return when we call the speak() method on Dog?

class Mammal def speak() return "hello!" end end class Dog < Mammal include Friendable def speak() return "woof woof" end end module Friendable def speak() return "Nice to meet you!" end end Dog.speak()

​

a.

"woof woof"

​

b.

An error

c.

"hello!"

​

d.

"Nice to meet you!"

​

Answer:

10. Which of the following method calls will mutate the string "hello"?

a.

greeting = "hello" greeting.delete "lo"

​

b.

greeting = "hello" greeting.gsub(/[aeiou]/, '*')

​

c.

greeting = "hello" greeting.replace("world")

​

d.

greeting = "hello" greeting.slice(3)

​

Answer

11. What does the following code output and return?

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |element, index| puts "The index of #{element} is #{index}." end

​

a.

# The index of [:a, "ant"] is 0. # The index of [:b, "bear"] is 1. # The index of [:c, "cat"] is 2. # => nil

​

b.

# The index of "ant" is 0. # The index of "bear" is 1. # The index of "cat" is 2. # => { :a => "ant", :b => "bear", :c => "cat" }

​

c.

# The index of :a is "ant". # The index of :b is "bear". # The index of :c is "cat". # => { :a => "ant", :b => "bear", :c => "cat" }

​

d.

# The index of [:a, "ant"] is 0. # The index of [:b, "bear"] is 1. # The index of [:c, "cat"] is 2. # => { :a => "ant", :b => "bear", :c => "cat" }

​

12. What does the following code return?

{ flour: '1c', sugar: '.5c', eggs: 2 }.first(2)

​

a.

[[:flour, '1c'], [:sugar, '.5c']]

​

b.

An error because hashes are unordered, so we can't use the first method here.

c.

{ flour: '1c', sugar: '.5c' }

​

d.

[:flour, '1c']

​

Answer

13. What will this code return?

{ a: "ant", b: "bear", c: "cat" }.include?("ant")

​

Answer:

14. What's the return value of reject in the following code?

[1, 2, 3].reject do |num| puts num > 2 end

​

a.

[3]

​

b.

[]

​

c.

[1, 2, 3]

​

d.

[1, 2]

​

Answer

15. What will the following code output?

a = 7 array = [1, 2, 3] def my_value(ary) ary.each do |b| a += b end end my_value(array) puts a

​

a.

An error will be raised

b.

13

​

c.

7

​

d.

10

​

Answer

16. The following code doesn't work as expected.

def someMethod(array, &block) array.map(block) end p someMethod([1, 3, 5]) { |n| n**2 }

​

Which of the following changes will produce the array [1, 9, 25]?

a.

def someMethod(array, &block) array.map(block.call) end p someMethod([1, 3, 5]) { |n| n**2 }

​

b.

def someMethod(array, &block) array.map(&block) end p someMethod([1, 3, 5]) { |n| n**2 }

​

c.

def someMethod(array, &block) array.map{ yield } end

​

d.

def someMethod(array, &block) block.call(array) end p someMethod([1, 3, 5]) { |n| n**2 }

​

Answer