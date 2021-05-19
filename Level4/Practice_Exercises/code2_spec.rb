class TemperatureConverter
    
    def convert_to_celsius(fahrenheit)
    ((fahrenheit - 32) * 5)/9
    end

    def convert_to_fahrenheit(celsius)
    ((celsius * 9) / 5) + 32
    end

end
obj = TemperatureConverter.new()
print obj.convert_to_celsius(32)

context "Celsius To Fahrenheit" do
    describe TemperatureConverter do
        it "It should return Celsius degrees converts to Fahrenheit" do
        converter = TemperatureConverter.new
        expect(converter.convert_to_celsius(32)).to eq 0
        end
    end
end

context "Fahrenheit To Celsius" do
    describe TemperatureConverter do
        it "It should return Fahrenheit degrees converts to Celsius" do
        converter = TemperatureConverter.new
        expect(converter.convert_to_fahrenheit(0)).to eq 32
        end
    end
end