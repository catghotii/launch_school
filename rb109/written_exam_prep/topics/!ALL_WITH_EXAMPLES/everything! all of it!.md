
# Precision of language

## Vocabulary

**Variable assignment**

```
a = "hello"
```

The variable `a` is initialised with a reference to the string object `"hello"`.

**Method invocation**

```
arr = [1, 2, 3]

new_array = arr.each { |num| puts num }
```

The `each` method is called on `arr` and passed a block as an argument...


# Variables and references

### Variables as pointers

### Mutability

### Mutation vs reassignment

## Variable scope

### Local variable scope in relation to blocks

### Variable shadowing

```ruby
val = 1

arr = [1, 2, 3].map do |val|
  puts val
  val += 1
end

puts val
p arr
```

- The block parameter `val` shadows the outer variable of the same name `val`, preventing access to the outer variable from within the block.

- Inside the block, `val` refers to each element of the array, not the outer variable. The outer `val` remains unchanged.

- `puts val` outputs the value of `val` that was initialised in the outer scope
	- —this is the only variable with the name `val` that is available to the `puts` call

---

**Variable scope of a block**:
- Variables initialised in the surrounding scope / outer code can be accessed and modified from within the block;
	- Reassignment of outer variables is possible from within blocks.
- Variables initialised inside the block cannot be accessed by outer code.
**Variable shadowing**:

- Occurs when a block parameter has the same name as a variable in an outer scope.
- When this happens, the block parameter shadows the outer variable, preventing access to the variable to the outer variable. The outer variable cannot be modified from within the block.
- Variable shadowing only occurs with block parameters, not variables within a block that have the same name as an outer variable. In these cases, reassignment would occur.

### Local variable scope in relation to method definitions

### Scope of constants

### Variable isolation


# Methods

## Key information

### Method definition vs method invocation

#### Parameters vs arguments

- the block parameter `_` is assigned to the value of the element of the current iteration

#### Default parameters

## Output vs return

### Method return values

#### Implict vs explicit return values

#### Using method return values as arguments

## Object passing
### Pass by reference value

**Pass by value**

**Pass by reference**
### Mutating vs non-mutating methods

#### Related: mutation vs reassignment

#### Related: variable scope of method definitions

### Passing and using blocks with methods


# Truthiness
 

# Iteration

### each

### map

### select

## related

#### block: variable scope, return value

#### truthiness

#### 