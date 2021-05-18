module Encryption
    
    private
  
    def encrypt(string)
      Digest::SHA2.hexdigest(string)
    end
    
end

class Person

    include Encryption
  
    def encrypted_password
      encrypt(@pass)
    end
  
end

person = Person.new
p person.encrypt("super secret")
