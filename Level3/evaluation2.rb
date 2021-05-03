module Similarity

    def distance_to(other)
    if block_given?
        yield other
    else
        m = self.length
        n = other.length
        print "m: #{m} - n: #{n}\n"
        return m if n == 0
        return n if m == 0
        d = Array.new(m+1) {Array.new(n+1)}

        (0..m).each {|i| d[i][0] = i}
        (0..n).each {|j| d[0][j] = j}
        (1..n).each do |j|
            (1..m).each do |i|
                d[i][j] = if self[i-1] == other[j-1]
                            d[i-1][j-1]
                            else
                            [ d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+1,].min
                        end
                    end
                end
                d[m][n]
            end
        end
    end   

class String

    include Similarity
    print "bananas".distance_to("ananas") # => 1
    print "\n"
    print "parrot".distance_to("parrot") # => 0
    print "\n"
    print "parrot".distance_to("torrap") # => 4
    print "\n"

    "bananas".distance_to("ananas") do |other|
        print other.length
        print "\n"
    end # => 6

end

