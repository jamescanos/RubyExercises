def leap_year?(year)
    year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end
  
if $0 == __FILE__
    [2001, 1900, 2000, 2004].each do |year|
        puts "#{year}: #{leap_year?(year)}"
    end
end