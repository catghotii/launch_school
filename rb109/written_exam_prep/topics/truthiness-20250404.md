### my summary

In programming, an important concept is how to express whether something is true or false in order to build conditional logic and understand the state of an object or expression.

The boolean objects `true` and `false` have the sole purpose of conveying whether a value/expression is true or false.

Truthiness refers to how values are evaluated in conditional contexts, like if statements.

In Ruby, everything is considered to be truthy except for the two falsy values/objects `false` and `nil`. Truthiness differs from boolean objects: it's important to note that what's considered true (or is truthy) or considered false (or falsy) is not the same as the boolean `true` and `false` objects; only the boolean object `true` is `true` and `false` is `false`.

Typically boolean objects are not used directly in conditionals; instead expressions in conditional contexts would evaluate to `true` or `false` objects. In other words, in conditional expressions, Ruby checks for whether the value is specifically the boolean `true` but rather if it's NOT one of the falsy values `false` or `nil`.

In terms of truthiness, Ruby differs from other programming languages in what values it considers to be "falsy": everything in Ruby is considered truthy except for the two falsy values `false` and `nil`. This means that empty strings, arrays, hashes, or the integer 0, would be considered truthy. In other programming languages, these 'empty' objects could be considered as falsy.
