Mock RB109 Written Exam - Advanced Questions
Based on your request and your current progress in the Ruby track (preparing for RB109), here are 4 advanced-level practice questions similar to what you might encounter on the written assessment:
1.  ​Advanced​: What will the following code output and why? Please explain step-by-step.
<!---->
# ruby

   arr = [1, 2, 3, 4, 5]
   new_arr = arr.select do |num|
     arr.delete(num) if num.odd?
   end
   p arr
   p new_arr
2.  ​Advanced​: What will the following code output and why? Explain in detail.
<!---->
# ruby

   def fix(value)
     value.upcase!
     value += '!'
     value
   end

   s = 'hello'
   t = fix(s)
   puts s
   puts t
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
4.  ​Advanced​: What will the following code output and why? Please be precise about how destructive vs. non-destructive methods affect the result.
<!---->
# ruby

   def add_name(arr, name)
     arr = arr + [name]
   end

   names = ['bob', 'kim']
   add_name(names, 'jim')
   puts names.inspect

   def add_name!(arr, name)
     arr << name
     arr
   end

   add_name!(names, 'jim')
   puts names.inspect