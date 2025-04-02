# Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# Answer:

# variables `a` and `c` will have the same object_id value, while `b` will have a different object_id value.

# Even though `a` and `b` reference the strings that are made up of the same characters, they are pointing to different String objects. The assignments on each string are essentially creating two different references to unique String objects stored in different addresses spaces in memory, despite the values of both strings being comprised of the same characters.

# In the assignment of `c = a`, `c` receives a copy of the reference stored in variable `a`. Therefore both variables contain references to the same String object, which can be seen when the object_id method is called on these variables.

# LS:

# When you run the code, the exact object ids may differ; however, the output should make it clear that a and b reference different objects. Don't be deceived by appearances — the two objects look the same (ie, they both have the value "forty two") but they are still different objects.

# Meanwhile, the object ids show that a and c reference the same object. This is because c was initialized to the object referenced by a. No surprises here.

# (Object ids are a private implementation detail of how Ruby executes the code "under the hood", and may differ depending on your specific environment, Ruby version, etc. There's no guarantee that an object will have the same object id in two different runs of the program, so never rely on the specific value of the id).