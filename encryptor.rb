class Encryptor
  # Creates a cipher to use for encryption and decryption
  def cipher(rotation)
    # All typable characters are put in an array
    characters = (' '..'z').to_a
    # Rotates all typable characters by a user defined number
    rotated_characters = characters.rotate(rotation)
    # Creates a hash with the characters and their rotated counterparts
    Hash[characters.zip(rotated_characters)]
  end

  # Allows the user to encrypt a string and pass in the rotation
  def encrypt_string(string, rotation)
    # Splits the string into characters in an array
    letters = string.split('')
      # Loops through all the characters and encrypts them with the specified rotation
      encrypted_letters = letters.collect do |letter|
        encrypt_letter(letter, rotation)
      end
      # Rejoins the encrypted letter into a string
      encrypted_letters.join
    end

  #alias_method :decrypt, :encrypt

  # Allows the user to decrypt a string with a set rotation value
  def decrypt_string(string, rotation)
    # Calls the encrypt method with -rotation, so that the user doesn't have to enter different values to encrypt or decrypt
    encrypt(string, -rotation)
  end

  def file(type, filename, rotation)
    input = File.open(filename, 'r')
    contents = input.read
    if type == 'encrypt'
       output = File.open(filename + '.encrypted', 'w')
      # Encrypt the text
      # Write out the text
      output.write(encrypt_string(contents, rotation))
    elsif type == 'decrypt'
      output = File.open(filename + '.decrypted', 'w')
      # Decrypt the text
      # Write out the text
      output.write(encrypt_string(contents, -rotation))
    end
    # Close the file
    output.close
  end

  # Encrypts each letter
  def encrypt_letter(letter, rotation)
    cipher(rotation)[letter]
  end
end 

  
