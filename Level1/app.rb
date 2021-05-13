class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = 'World')
    @names = names
  end

  # Say hi to everybody
  def say_hi
    return '...' if @names.nil?
    return @names.map { |name| "Hello #{name}!" } if @names.class == Array
    "Hello #{@names}!"
  end

  # Say bye to everybody
  def say_bye
    return '...' if @names.nil?

    if @names.class == Array
      # Join the list elements with commas
      return "Goodbye #{@names.join(", ")}.  Come back soon!"
    end

    # return "Goodbye #{@names.join(", ")}. Come back soon!" if @names.class == Array

    "Goodbye #{@names}. Come back soon!"
  end
end

  if __FILE__ == $0
    mg = MegaGreeter.new
    var = mg.say_hi
    puts var.upcase
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