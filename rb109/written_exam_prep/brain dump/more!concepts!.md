##### Guard clauses

- a conditional statement at the beginning of a method or code block that checks for certain conditions and returns early if they're met, rather than nesting the main code inside an if/else statement
- helps to avoid deep nesting, makes code more readable, and often simplifies logic flow

```ruby
# without guard clauses
def calculate_bonus(salary, good_performance)
  if good_performance
    salary * 0.1
  else
    0
  end
end

# with early return and guard clauses
def calculate_bonus(salary, good_performance)
  return 0 unless good_performance
  salary * 0.1
end
```

##### Return value of if statement

- if statements return the value of the executed branch (if/elsif/else)
- if no branch within the if statement is executed, `nil` is returned. This happens when the condition evaluates to `false` (or `nil`) and there is no `else` clause
- If there's no branch to "salvage" an if statement, Ruby has nothing to return, so it returns `nil` by default.
- This behaviour is consistent with other control expressions/structures (like `while` loop): they also return `nil` by default unless modified by something like a `break` something with a value

### Methods

##### `dup` method

- `dup` creates a shallow copy: it duplicates the instance variable but not the objects within it—the new object has a different object id than the calling object

##### `inspect`

- returns a string representation of an object that's typically more detailed than what you'd get from `to_s`
	- shows the internal structure of objects
