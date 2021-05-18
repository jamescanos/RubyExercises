=begin
    Blocks can be write it in multiple lines with end, or in a single line like this
    [1, 2, 3, 4, 5].each { |number| puts "#{number} was passed to the block" }
=end
[1, 2, 3, 4, 5].each do |number|
    puts "#{number} was passed to the block"
end