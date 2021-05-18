class Temperature

    def convert_to_celsius(fahrenheit)
        totalCelsius = ((Float(fahrenheit) - 32) * 5/9)
        puts totalCelsius
    end

    def convert_to_fahrenheit(celsius)
        totalFahren = (Float(celsius) * 9/5) + 32
        puts totalFahren
    end

end

obj = Temperature.new
obj.convert_to_celsius(32)
obj.convert_to_fahrenheit(0)