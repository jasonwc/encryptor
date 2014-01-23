class Encryptor
  def cipher
    rotation = 25
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash(characters.zip(rotated_characters))
  end

  def encrypt(string)
    letters = string.split('')
      encrypted_letters = letters.collect do |letter|
        encrypt_letter(letter)
      end
      encrypted_letters.join
    end

  alias_method :decrypt, :encrypt

  #def encrypt(string)
  #  letters = string.split('')
  #    encrypted_letters = letters.collect do |letter|
  #      encrypt_letter(letter)
  #    end
  #    encrypted_letters.join
  #  end

  def encrypt_letter(letter)
    cipher[letter.downcase]
  end
end 

  
