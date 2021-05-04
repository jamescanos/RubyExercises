class Similarity

    def self.similar(strA, strB)        
        
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