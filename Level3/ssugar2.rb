class NewDog  
    def initialize(breed)  
      @breed = breed  
    end  
    attr_reader :breed, :name # create reader only  
    
    # setter method  
    def name=(nm)  
      @name = nm  
    end  
  end  
    
  nd = NewDog.new('French Poodle')  
  #nd.name=('Benzy')  
  nd.name = 'Honey'  
  puts nd.name
  puts nd.breed  