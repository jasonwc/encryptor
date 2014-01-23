class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt(string, rotation)
    letters = string.split('')
      encrypted_letters = letters.collect do |letter|
        encrypt_letter(letter, rotation)
      end
      encrypted_letters.join
    end

  #alias_method :decrypt, :encrypt

  def decrypt(string, rotation)
    encrypt(string, -rotation)
  end

  def encrypt_letter(letter, rotation)
    cipher(rotation)[letter]
  end
end 

  
