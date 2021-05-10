class Product

    VALID_DISCOUNT_RANGE = (0.0..1.0)

    attr_accessor :name, :price
    
    def initialize(name, price)
        @name = name
        @price = price if price > 0
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
            @platform = :pc
        end

    end

    def to_s
        "#{super} - #{@platform}"
    end

end

class Book < Product
    
    CATEGORIES = [:adventure, :scifi, :romance, :horror]

    attr_accessor :category

    def initialize(name, price, category)
        
        super(name, price)

        if CATEGORIES.include? category
            @category = category
        else
            @category = :scifi
        end
    end
    
    def to_s
        "#{super} - #{@category}"
    end

end


#Game.new("Halo",1000,"ps4")
#Game.to_s
#Book.new("Silence",1000,"horror")
#Book.to_s
#obj = Product.new("Gray",2000)
#obj.print

context "Product" do
    describe Product do
        it "Print Product" do
        product = Product.new("Gray",20000)
        expect(product.print).to eq nil
        end
    end
end

context "Game" do
    describe Game do
        it "Add game" do
        product = Game.new("Halo",20000,"pc")
        expect(product.to_s).to eq "Game - Halo - $20000.00 - pc"
        end
    end
end

context "Discounts" do
    describe Product do
        it "Negative Discount" do
        product = Product.new("Gray",20000)
        expect(product.discount(-1)).to eq nil
        end
    end
end

context "Discounts" do
    describe Product do
        it "Discount above 1.0" do
        product = Product.new("Gray",20000)
        expect(product.discount(1.5)).to eq 0
        end
    end
end