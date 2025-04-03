=begin

Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end


# Answer:

Although both methods return the same result, there are also differences:

In the first method, the object that is passed in as the buffer argument is mutated in the method body: `<<` and `shift` method calls mutate the calling object referenced by `buffer`, which means that any references outside of the method will also be affected and point to this modified object.
This method returns a meaningful value and performs a side effect, which should be avoided.

In the second method, a `buffer` variable is initialised and the mutating methods `<<` and `shift` are called on the new object, leaving any objects passed in as arguments unmodified by the code in the method body.


# LS solution:

Yes, there are several differences.

Both methods have the same return value. However, the first implementation returns a reference to the object passed in as the buffer argument, while the second returns a new object. Furthermore, the first implementation mutates the argument given by the buffer argument, while the second does not mutate its input_array argument. That is, the code that calls rolling_buffer1 will see a modified array after the method returns, while the code that calls rolling_buffer2 will not see any changes in the array.

It's also worth noting that Alyssa's first solution both returns a meaningful value and has a side effect. As we learned earlier, that's something we should avoid. Thus, the second solution is probably the better of the two.


=end