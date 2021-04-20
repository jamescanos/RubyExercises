class Temperature

    def ConverterTemp()
        
        print "Type '1' to convert from Celsius to Fahrenheit
            Type '2' to convert from Fahrenheit to Celsius \n"
        
        # option selected
        option = gets.chomp
        
        if option == "1"
        
            # get Celsius degrees from user
            print "Enter Celsius Temperature: \n"
            degreesVal = gets.chomp

            # converts temperatures from Celsius to Fahrenheit
            #(Tc × 9/5) + 32 = Tf
            totalFahren = (Float(degreesVal) * 9/5) + 32
        
            print "#{degreesVal} degrees Celsius is equal to #{totalFahren} degrees Fahrenheit"
        
        elsif option == "2"
        
            # we will use the following formula C = (5/9)(F -32)
            print "Enter Fahrenheit Temperature: \n"

            # get Fashrenheit degrees from user
            degFah = gets.chomp
            #degreesVal = (5*(Float(degFah) - 32))/9
            totalCelsius = ((Float(degFah) - 32) * 5/9)
    
            print "#{degFah} degrees Fahrenheit is equal to #{totalCelsius} degrees Celsius"
        
        else print "Input was not recognized as 1 or 2
            Type '1' to convert from Celsius to Fahrenheit
            OR Type '2' to convert from Fahrenheit to Celsius \n "
        
        end

    end

end

obj = Temperature.new
obj.ConverterTemp()