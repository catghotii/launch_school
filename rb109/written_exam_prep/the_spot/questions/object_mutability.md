## Object Mutability/Mutating Methods

[Here’s the article](https://launchschool.com/blog/mutating-and-non-mutating-methods) with some of the below examples

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)  value.upcase!  value.concat('!')  valueends = 'hello't = fix(s)

What values do `s` and `t` have? Why?

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)  value = value.upcase  value.concat('!')ends = 'hello't = fix(s)

What values do `s` and `t` have? Why?

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)  value << 'xyz'  value = value.upcase  value.concat('!')ends = 'hello't = fix(s)

What values do `s` and `t` have? Why?

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value)  value = value.upcase!  value.concat('!')ends = 'hello't = fix(s)

What values do `s` and `t` have? Why?

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

def fix(value) value[1] = 'x' value ends = 'abc't = fix(s)

What values do `s` and `t` have? Why?

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

def a_method(string)  string << ' world'enda = 'hello'a_method(a)

p a

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

arrnum = 3num = 2 * num

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

a = %w(a b c)a[1] = '-'p a

### Example 9

[Link to page with #9 & #10](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)

def add_name(arr, name)  arr = arr + [name]endnames = ['bob', 'kim']add_name(names, 'jim')puts names

### Example 10

def add_name(arr, name)  arr = arr << nameendnames = ['bob', 'kim']add_name(names, 'jim')puts names