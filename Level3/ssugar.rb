class NewDog  
    def initialize(breed, name)  
      @breed = breed  
      @name = name  
    end  
    attr_reader :breed, :name   # create reader only  
  end  
  nd = NewDog.new('Doberman', 'Benzy')  
  puts nd.name  