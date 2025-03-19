=begin

Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob

you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

What does this print out? Can you explain these results?

---

On line 2, the variable save_name receives a copy of the reference stored in the variable name that refers to the string object 'Bob'.

On line 3, the upcase! method—a mutating method—is called on the variable name, which modifies the conents of the string object it's pointing to, changing the string case to uppercase characters. This method permanently modifies the contents of the string object 'Bob' to 'BOB'. Even though the upcase! method was called on name, it causes a change to the string object to which save_name also refers. (save_name contains another reference to the same string object.)

Both variables—name and save_name—hold references to the original string object which has now been mutated to 'BOB' so printing both name and save_name will effectively print the same string object 'BOB'.

Line 4 outputs:

BOB
BOB

=end

