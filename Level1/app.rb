class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = 'World')
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      return '...'
    elsif @names.class == Array
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      return  "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      return  "..."
    elsif @names.class == Array
      # Join the list elements with commas
      return  "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      return  "Goodbye #{@names}.  Come back soon!"
    end
  end
end

  if __FILE__ == $0
    mg = MegaGreeter.new
    puts mg.say_hi
    puts mg.say_bye

    # Change name to be "Zeke"
    mg.names = "Jhon"
    puts mg.say_hi
    puts mg.say_bye

    # Change the name to an array of names
    mg.names = ["James", "Francisco", "Cesar",
                "David", "Chris"]
    puts mg.say_hi
    puts mg.say_bye

    # Change to nil
    mg.names = nil
    puts mg.say_hi
    puts mg.say_bye
  end