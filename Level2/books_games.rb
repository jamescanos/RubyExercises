class Products
    
    attr_accessor :type, :name, :price, :platform, :category, :discount, :option, :product

    def initialize()        
        
        @name
        @price = 0.0
        #@platform
        #@category
        #@discount
        @product = []
        @category = ["Adventure","Romance","Scifi","Horror"]
        @platform = ["PS4","XBox","PC"]
    end

    def sales

        puts "\n########### Book & Games Store ###########
              \nWelcome to Book & Game Store"  

        loop do

            puts "\nTo add a Book type 1, to add a Game Type 2"   

            option = gets.chomp.to_i

            puts "\nName: " 
            name = gets.chomp

            puts "\nPrice: " 
            price = gets.chomp

            if(option == 1)

                type = "Book"

                puts "\n########### Categories ###########
                      \nTo add a category, type the code of one of the options below\n1-Adventure\n2-Romance\n3-Scifi\n4-Horror"

                puts "\nCategory: " 
                field = gets.chomp
            
            elsif(option == 2)

                type = "Game"

                puts "\n########### Platforms ###########
                      \nTo add a platform, type the code of one of the options below\n1-PS4\n2-XBox\n3-PC"

                puts "\nCategory: " 
                field = gets.chomp

            end
            
            product.push(["#{type}","#{name}","#{price}","#{field}"])

            puts "\n\nDo you want to add another Product? y/n \n"

            resp = gets.chomp

            if resp == 'n'
                break
            end
            

        end

    end

    def print

        pp product

        product.each_with_index do |(key, title, cost, sfield), i|

            if(key == "Book")
                catplat = category[sfield.to_i-1]
            elsif(key == "Game")
                catplat = platform[sfield.to_i-1]
            end

            puts "Product: #{key}, Name: #{title}, Price: #{cost}, Field: #{catplat}" 
        end

    end

    def discount

    end

end

obj = Products.new
obj.sales
obj.print