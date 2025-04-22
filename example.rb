# 3.  ​**Intermediate**​: Identify and fix the issue in the following code that violates the guideline about methods mixing output and meaningful return values:<!---->



# def calculate_and_show_total(items)
#   total = items.sum
#   puts "Total: $#{total}"
#   return total
# end  
 
# bill = calculate_and_show_total([10, 5, 3])
# new_bill = bill * 1.15


def calculate_total(items)
  return 0 if items.nil? || items.empty?
  items.sum.to_f
end

def show_total(total)
  puts "Total: $#{total}"
end

bill = calculate_total([10, 5, 3])
new_bill = bill * 1.15

show_total(bill)
show_total(new_bill)