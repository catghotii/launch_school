=begin

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
- the delete_at() takes an argument of the index and removes the element at that index. It returns the deleted element.
=> 2
- it is destructive, so the original array object now contains [1, 3, 4, 5]

numbers.delete(1)
- deletes the first occurrence of the argument passed in, and returns this deleted element (=> 1)
- destructive / mutating method, so the Array object now looks like [2, 3, 4, 5]


# LS solution

numbers.delete_at(1) # numbers is now [1, 3, 4, 5]

(note that the array is operated on directly and the return value of the call is the removed item 2)

numbers.delete(1) # numbers is now [2, 3, 4, 5]

(note that the array is operated on directly and the return value of the call is the removed item 1)

Another thing to notice is that while both of these methods operate on the contents of the referenced array and modify it in place (rather than just returning a modified version of the array) these methods do NOT have the usual ! at the end of the method name for "modify in place" method names.

=end