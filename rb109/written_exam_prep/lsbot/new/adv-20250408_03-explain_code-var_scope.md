3.  ​Advanced​: Explain the output of this code with specific attention to variable scoping rules:
<!---->
# ruby

   a = 'hello'

   def my_method
     puts a
   end

   def my_method2
     a = 'goodbye'
     my_method
   end

   my_method2