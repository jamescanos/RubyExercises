=begin
    Create a method that, given two strings A and B, it returns the amount of modifications (adding,
    removing or replacing a character) required to turn A into B. If A and B are equals, the method
    should return 0. It should be used as:

    “bananas”.distance_to(“ananas”) # => 1
    “parrot”.distance_to(“parrot”) # => 0
    “parrot”.distance_to(“torrap”) # => 4
=end
module Compare

    def similar(strA, strB)        
        
        # Block of code as a parameter
        if block_given?
            # if yield would execute a block in strB
            yield strB
        else
                        
            lgthA = strA.length # Length String A
            lgthB = strB.length # Length String B
            max = lgthA/2 # 
            #print "Max: #{max}\n"

            return lgthB if (0 == lgthA)
            return lgthA if (0 == lgthB)
            return lgthA if (lgthA - lgthB).abs > max

            # Convert elements of lengthB into array
            elemarr = (0..lgthB).to_a
            count = nil
            
            # Loops stringA until lengthA
            lgthA.times do |i|
            
            # Increment i value
            increment = i+1
                # Loops stringB until lengthB
                lgthB.times do |j|
                    # if strA ie equal to strB then 0 else 1
                    assign = (strA[i] == strB[j]) ? 0 : 1
                               # adding         # removing      # replacing
                    count = [elemarr[j+1] + 1, increment + 1, elemarr[j] + assign].min
                    elemarr[j] = increment
                    increment = count
                end
                elemarr[lgthB] = count
            end
            #print "count: #{count}\n"
            return count
        end
        
    end

end

class String
    include Compare
end

string = String.new
print string.similar("bananas", "ananas")
print "\n"
print string.similar("parrot", "parrot")
print "\n"
print string.similar("parrot", "torrap")
print "\n"

string.similar("bananas", "ananas") do |other|
    print other.length
    print "\n"
end # => 6