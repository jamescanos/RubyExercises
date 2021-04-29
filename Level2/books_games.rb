class Products
    
    attr_accessor :type, :name, :price, :platform, :category, :discount, :option, :product, :percent

    def initialize()        
        
        @name
        @price = 0.0
        #@platform
        #@category
        @discount = 0.0
        @product = []
        @category = ["Adventure","Romance","Scifi","Horror"]
        @platform = ["PS4","XBox","PC"]
        @percent = []
    end

    def sales

        puts "\n########### Book & Games Store ###########
              \n################ Welcome #################"  

        loop do

            puts "\nTo add a Book type 1, to add a Game Type 2"   

            option = gets.chomp.to_i            

            if(option == 1)

                type = "Book"

                puts "\nName: " 
                name = gets.chomp

                puts "\nPrice: " 
                price = gets.chomp

                puts "\n########### Categories ###########
                      \nTo add a category, type the code of one of the options below\n1-Adventure\n2-Romance\n3-Scifi\n4-Horror"

                puts "\nCategory: " 
                field = gets.chomp

                product.push(["#{type}","#{name}","#{price}","#{field}"])
            
            elsif(option == 2)

                type = "Game"

                puts "\nName: " 
                name = gets.chomp

                puts "\nPrice: " 
                price = gets.chomp

                puts "\n########### Platforms ###########
                      \nTo add a platform, type the code of one of the options below\n1-PS4\n2-XBox\n3-PC"

                puts "\nCategory: " 
                field = gets.chomp

                product.push(["#{type}","#{name}","#{price}","#{field}"])
            
            elsif(option !=1 || option !=2)
                #print "Invalid Option, Type '1' to add a book, '2' to add a game \n "
                #product = ([])
                break
            end

            puts "\nDo you want to add another Product? y/n \n"

            resp = gets.chomp

            if resp == 'n'
                print
                break
            end
            
        end

    end

    def print

        #p product.length
        if(product.length != 0)
            
            product.each_with_index do |(key, title, cost, sfield), i|

                if(key == "Book")
                    catplat = category[sfield.to_i-1]
                    labcatplat = "Category"
                    
                    if(percent[0] != nil)
                        newperc = (percent[0].to_f/100)
                        newval = cost.to_f * newperc.to_f
                        cost = (cost.to_f-newval.to_f)
                    end

                elsif(key == "Game")
                    catplat = platform[sfield.to_i-1]
                    labcatplat = "Platform"

                    if(percent[1] != nil)
                        newperc = (percent[1].to_f/100)
                        newval = cost.to_f * newperc.to_f
                        cost = (cost.to_f-newval.to_f)
                    end
                    
                end

                puts "\nType: #{key} | Name: #{title} | Price: #{cost} | #{labcatplat}: #{catplat}" 
            end
        else
            print "There's not books or games stored"
        end
    end

    def discount

        x=1
        j=0
        prd = ["Books","Games"]

        if(product.length != 0)

            puts "\nDo you want to apply discount? y/n \n"   
            option = gets.chomp

            
            if(option == "y" || option == "yes")
                
                puts "\nType the descoint percentage without symbol. Ex: 10" 

                loop do
                    
                    label = prd[j.to_i]

                    puts "\n#{label} Discount:\n"   
                    discount = gets.chomp                

                    #percent.push(["#{label}","#{discount}"])
                    percent.push("#{discount}")

                    if j == x
                        break
                    end
                    j+=1
                end
            end

            print

        else
            print "There's not books or games stored"
            sales
        end

    end

end

obj = Products.new
obj.sales
#obj.print
obj.discount