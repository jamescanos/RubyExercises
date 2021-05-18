a = b = 'Original String'  
b.freeze  
puts a.frozen? # true  
puts b.frozen? # true  
a = 'New String'  
puts a  
puts b  
puts a.frozen? # false  
puts b.frozen? # true