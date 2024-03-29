class Duck  
    def quack  
      'Quack!'  
    end  
    
    def swim  
      'Duck Paddle paddle paddle...'  
    end  
  end  
    
  class Goose  
    def honk  
      'Goose Honk!'  
    end  
    def swim  
      'Goose Splash splash splash...'  
    end  
  end  
    
  class DuckRecording  
    def quack  
      play  
  end  
    
    def play  
      'Quack Quack!'  
    end  
end  
    
  def make_it_quack(duck)  
    duck.quack  
  end  
  puts make_it_quack(Duck.new)  
  puts make_it_quack(DuckRecording.new)  
    
  def make_it_swim(duck)  
    duck.swim  
  end  
  puts make_it_swim(Duck.new)  
  puts make_it_swim(Goose.new)  