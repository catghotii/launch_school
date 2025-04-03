# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if 1 + 2
  greeting = "hello world"
end

puts greeting

# Answer:

# `greeting` returns `nil` because an if statement that evaluates as false and no other clause to salvage it, will always return `nil`

# When a local variable is initialized within an if clause that doesn't get executed, it is it initialized instead to `nil`.

# LSBot:

# What's happening here is:
# 1.  Ruby's parser first scans your code and identifies all local variable assignments, including those inside conditional branches.
# 2.  During this parsing phase, Ruby registers that greeting is a local variable that exists in the program, even though it's inside a conditional branch that will never execute.
# 3.  When the program runs, the if false condition evaluates to false, so the code inside never executes - meaning the line greeting = "hello world" is never run.
# 4.  However, since Ruby already recognized greeting as a local variable during parsing, it exists in memory but without any assigned value - so it defaults to nil.

# LS:

# greeting is nil here, and no "undefined method or local variable" exception is thrown. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined. However, when you initialize a local variable within an if clause, even if that if clause doesn’t get executed, the local variable is initialized to nil.
