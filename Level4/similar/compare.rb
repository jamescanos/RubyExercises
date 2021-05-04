require 'similarity'

print Similarity.similar("bananas", "ananas")
print "\n"
print Similarity.similar("parrot", "parrot")
print "\n"
print Similarity.similar("parrot", "torrap")
print "\n"

Similarity.similar("bananas", "ananas") do |other|
    print other.length
    print "\n"
end # => 6