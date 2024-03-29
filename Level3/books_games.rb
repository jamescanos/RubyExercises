require 'logger'    

module Logging

    LEVELS = [:debug, :error, :fatal, :info, :warn]
    
    def log(message, level)
        
        if(LEVELS.include?(level))
            puts "#{level.to_s.upcase} - #{Time.now} - #{message}"
        else
            raise "Level #{level} doesn't exist. These are Available levels: #{LEVELS}."
        end

    end
    
end

class Product
    
    include Logging

    DISCOUNT_RANGE = (0.0..1.0)

    attr_accessor :name, :price, :product

    def initialize(name, price) 
        log("Add product #{name} - #{price}",:info)      
        @name = name
        @price = price if price > 0
        #@product = []        
    end

    def discount(value)
        log("Applying discount #{value * 100}% to Product #{@name} with initial price of $#{'%.2f' % @price}",:debug)
        #puts value
        @price = @price * (1 - value) if(DISCOUNT_RANGE.include?(value))
        #puts @price
    end

    def print
        puts "#{@name} - $#{'%.2f' % @price}"
    end  
end

class Game < Product

    PLATFORMS = [:ps4, :xbox, :pc]
    
    attr_accessor :platform

    def initialize(name, price, platform)
        
        super(name, price)

        if PLATFORMS.include? platform
            @platform = platform
        else
            @platform = :ps4
        end

    end

    def print
        puts "#{@name}, #{price}, #{@platform}"
    end


end

class Book < Product

    CATEGORIES = [:adventure, :horror, :romance, :scifi]

    def initialize(name, price, category)

        super(name, price)

        if CATEGORIES.include? category
            @category = category
        else
            @category = :adventure
        end

    end

    def print
        puts "#{@name}, #{price}, #{@category}"
    end

end

#obj = Games.new

p1 = Product.new("Always",30000)
#p1.print
p1.discount(0.5)
p1.print

g1 = Game.new("Halo",80000,:pc)
g1.discount(0.2)
g1.print
g2 = Game.new("Final Fantasy",30000,:pc)
g2.print

b1 = Book.new("El Principito",75000,:adventure)
b1.discount(0.3)
b1.print
b2 = Book.new("Cien Años de Soledad",90000,:pc)
b2.print