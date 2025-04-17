https://launchschool.medium.com/launch-school-live-session-beginning-ruby-c6432494ab34

- [Part 1](https://medium.com/launch-school/launch-school-live-session-beginning-ruby-c6432494ab34) (syntactical sugar, where code comes from, and variable scope)
- [Part 2](https://medium.com/launch-school/live-session-beginning-ruby-part-2-f87d821ce926) (pass by reference/value, variables as pointers, method side-effects vs return value)
- [Part 3](https://medium.com/launch-school/live-session-beginning-ruby-part-3-61180782f721) (Arrays and Hashes, common mistakes when using `select` and `map`, and the `Enumerable` module)

## part 1

Problem:
syntactical sugar --> allow Ruby to be read in an expressive way but can be confusing 

#### syntactical sugar

makes reading ruby difficult if you don't understand ruby 
looks simple but lots of complexity underneath it -- working with a different mental model
e.g. languages that require `()` in the method invocation is a more straightforward mental model to work with

```ruby
# str = "bob"

def str
  "a method"
end

p str # how does Ruby understand this?
```

"printing out the return value of the method invocation"

printing out the value of the `str` variable

NameError

```
# reading ruby syntactical sugar 

p str
p str() # parentheses are optional for method invocations
p(str()) # argument parentheses are optional --> this is actually two method calls

# parentheses are more helpful for debugging
```

## part 2

```ruby
def prefix(str)
  "Mr. " + str
end

name = 'joe'
prefix(name)

# fix 1
# capture the return value # reassignment of name based upon the return value of the prefix method
# name = prefix(name)

# fix 2
# or use a mutation in the method definition --> "Mr. " << str

# which one?
# depends on where else you want to use the method, and whether it makes sense for the method to have side effects
# fix 2 is dangerous because the object is being mutated permanently
```

"capturing return value"

```ruby
def prefix!(str)
  "Mr. " << str
end

# add ! to the method name to signal that the method is destructive
```


takeaways 

- code with intention. be explicit / intentional when you code!
- in the early stages, it's important to have a little fun and get some program running
- as you start to take it more seriously, a goal to get a job, buckle down and understand the nuances of the language

how many hours should you study per day? diminishing returns...

- requires consistent practice over a long period of a time to have mastery over concepts
- your brain needs rest!
- 4-5 hours of intense studying per day (for the instructor) - your mileage may vary
- 