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