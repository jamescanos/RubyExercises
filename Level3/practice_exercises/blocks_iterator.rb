# Inside the block adds index to number itself. So, (number, index) 1+0
numbers = [1, 2, 3, 4, 5].collect.with_index do |number, index|
    number + index
end
# p is a method that shows a more “raw” version of an object.
p numbers