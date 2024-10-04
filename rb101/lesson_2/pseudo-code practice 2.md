#### Exercise 1

- a method that returns the sum of two integers

```plaintext
# HIGH LEVEL PSEUDO-CODE

- Get the first number
- Get the second number
- Add the two numbers together
- Display the result
```

```plaintext
# CASUAL

Get first number from user.
Set variable for first number.
Get second number from user.
Set variable for second number.

Add first and second number together.
Set variable for sum result.
Display result.

# FORMAL

START

GET first_number
SET first_number
GET second_number
SET second_number
SET result = first_number + second_number

DISPLAY result

END
```

#### Exercise 2

- a method that takes an array of strings, and returns a string that is all those strings concatenated together

```plaintext
# HIGH LEVEL

Get an array of strings.
Extract each element to a new string.
Return new string.
```

```plaintext
# CASUAL

Get an array of strings
Set a variable for this array.

Iterate over each string object in the string.
Add the string object to a new_string variable.
Add a whitespace character to the new_string variable.
Repeat until the end of the array.

# FORMAL

START

SET array_strings = GET
SET new_string = ""
SET whitespace = " "
SET idx = 0
SET current = nil

WHILE idx < array_strings.length
  SET current = array_strings[idx]
  SET new_array = new_array + current + whitespace
  SET idx = idx + 1

DELETE last whitespace character

PRINT new_string
```

```ruby
array_strings = %w(hello writing pseudocode is hard)
new_string = ""
whitespace = " "
idx = 0
current = nil

while idx < array_strings.length
  current = array_strings[idx]
  new_string = new_string + current + whitespace
  idx = idx + 1
end

# method for removing last character of string

puts new_string
```

#### Exercise 3

- a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:

```ruby
every_other([1,4,7,2,5]) # => [1,7,5]
```

```plaintext
# HIGH LEVEL

get array of integers

iterate over array:
- extract element and put it in a new array, starting from the first element
- skip the next element
- repeat until the end of the array
```

```plaintext
# CASUAL

Get array of integers from user
Set variable for this array.
Set variable for index counter.
Set variable for current array element.
Set variable for new array.

keep going: if index counter < array length
iterate over array:
- set current element by referencing array[index]
- save current element to new array
- increment index by 2
(stop if index > array length)

# FORMAL

START

GET array of integers
SET array_integers
SET idx = 0
SET current = nil
SET new_array = []

WHILE idx < array.length
  SET current = array_integers[idx]
  SET new_array = array_integers.push(current)
  SET idx = idx + 2

PRINT new_array

END
```

```ruby
array_integers = [1,4,7,2,5]
idx = 0
current = nil
new_array = []

while idx < array_integers.length
  current = array_integers[idx]
  new_array = new_array.push(current)
  idx = idx + 2
end

p new_array
```

```ruby
def every_other(array)
  idx = 0
  current = nil
  new_array = []

  while idx < array.length
    current = array[idx]
    new_array = new_array.push(current)
    idx += 2
  end

  return new_array
end

p every_other([1,4,7,2,5])
```

```ruby
def every_other(array)
  array.select { |e| e.odd? }
end

p every_other([1,4,7,2,5])
```

#### Exercise 4

- a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is `'x'` and the string is `'axbxcdxex'`, the method should return 6 (the index of the 3rd `'x'`). If the given character does not occur at least 3 times, return `nil`.

```plaintext
- get a string
- get the character to look for matches

- go through each character of the string
	- if a match is found, record the index
	- if no match is found, keep going
- repeat
- stop if 3 matches are found, or reach the end of the string

- if 3 matches found: display recorded index
- if < 3 matches: display nil
```

```plaintext
# CASUAL

Set variables for:
- string
- character
- index_counter
- current_character
- match_counter
- saved_index

Iterate over each character in the given string.
For each iteration:
- If a character match is found
	- save the current index to a variable
	- increment that match_counter by 1
- If no match is found, move onto the next iteration.

Stop when 3 matches are found or reach the end of the string without reaching 3 matches.

Return saved index if 3 matches found.
Return nil if < 3 matches found.


# FORMAL

# return the index of the 3rd occurrence of a given character in a string
# if < 3 matches found, return nil

START

SET string = GET
SET char = GET

SET idx = 0
SET current = nil
SET match_count = 0
SET saved_idx = nil

WHILE match_count != 3
  SET current = string[idx]
  IF current == char
    SET match_count = match_count + 1
    SET saved_idx = idx
  SET idx = idx + 1

IF match_count < 3
  RETURN nil
ELSE
  RETURN saved_idx

END
```

```ruby
string = 'axbxcdxex'
char = 'x'

idx = 0
current = nil
match_count = 0
saved_idx = nil

loop do
  current = string[idx]
  if current == char
    match_count = match_count + 1
    saved_idx = idx
  end
  idx = idx + 1
  break if match_count == 3
end

puts (match_count == 3) ? saved_idx : nil
```

#### Exercise 5

- a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:

```ruby
merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
```

You may assume that both array arguments have the same number of elements.

```plaintext
# given two arrays of numbers (of the same length)
# return result of merging these arrays by alternating order:
# values at even indices from the first array
# values at odd indices from the second array

- get two arrays of the same length

iterate over the first array
- add the current element to the new array

iterate over the second array
- add the current element to the new array

repeat until the length of the new array is equal to the sum of the lengths of both original arrays
```

```plaintext
# CASUAL

Get two arrays of the same length.

Iterate over both collections, alternating between the two arrays.

First array:
- save the current element of the iteration
- add this value to the new array
Second array:
- save the current element of the iteration
- add this value to the new array

Repeat until the length of the new array is equal to the sum length of both original arrays.

Display new array.


# FORMAL

START

SET array_1 = GET
SET array_2 = GET
SET merged_array = []

SET idx = 0
SET current_1 = nil
SET current_2 = nil

WHILE merged_array.length < sum length of array_1 + array_2
  SET current_1 = array_1[idx]
  SET current_2 = array_2[idx]
  SET merged_array = merged_array + current_1 + current_2
  SET idx = idx + 1

DISPLAY merged_array

END
```

```ruby
array_1 = [1,2,3]
array_2 = [4,5,6]
merged_array = []

idx = 0
current_1 = nil
current_2 = nil

while merged_array.length < (array_1.length + array_2.length)
  current_1 = array_1[idx]
  current_2 = array_2[idx]
  merged_array = merged_array.push(current_1,current_2)
  idx = idx + 1
end

p merged_array
```