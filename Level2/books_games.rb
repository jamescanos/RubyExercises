class Product
    
    VALID_DISCOUNT_RANGE = (0.0..1.0)

    attr_accessor :name, :price, :product

    def initialize(name, price)       
        @name = name
        @price = price if price > 0
        #@product = []        
    end

    def discount(discount_value)
        @price * (1 - discount_value) if(VALID_DISCOUNT_RANGE.include?(discount_value))
    end

    def to_s
        "#{self.class.name} - #{@name} - $#{'%.2f' % @price}"
    end

    def print
        puts self.to_s
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

    CATEGORIES = [:adventure, :scifi, :romance, :horror]

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

p1 = Product.new("Halo",30000)
p1.print
p1.discount(10000)
p1.print

g1 = Game.new("Halo",80000,:pc)
g2 = Game.new("Final Fantasy",30000,:pc)

b1 = Book.new("El Principito",30000,:adventure)
b2 = Book.new("Cien Años de Soledad",30000,:pc)

g1.print
g2.print

b1.print
b2.print


#g = Games.new
#g.plat(obj.product[0],obj.product[1],"xbox")

#obj.print_results
#obj.print
#obj.discount