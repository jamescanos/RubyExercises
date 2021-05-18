require 'digest'

module Encryption

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
person.pass = "super secret"
puts person.encrypted_password