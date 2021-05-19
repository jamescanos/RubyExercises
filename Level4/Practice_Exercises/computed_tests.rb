def leap_year?(year)
    #year % 400 == 0 or year % 100 != 0 and year % 4 == 0
    true
  end
  
  if $0 == __FILE__
    data = {
      2001 => false,
      1900 => false,
      2000 => true,
      2004 => true
    }
  
    data.each do |year, expected|
      actual = leap_year?(year)
      if expected == actual
        puts "leap_year?(#{year}) returned #{actual} as expected."
      else
        puts "KAPUTT! leap_year?(#{year}) did not return #{expected} as expected, but actually returned #{actual}."
      end
    end
  end