# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

p (10..100).include?(42)
# => true

# LS solution

p (10..100).cover?(42)
# => true