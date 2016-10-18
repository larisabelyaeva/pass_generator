# pronounceable password generator
# displays user-defined number of passwords

class PasswordGenerator

  public

  # method of generating passwords
  def create_passwords (number_of_passwords)
    read_files
    passwords = Array.new(number_of_passwords)
    i = 0
    passwords.each do |password|
      password = @@prefixes[rand(@@prefixes.size- 1)]
      password << @@syllables[rand(@@syllables.size - 1)]
      password << @@postfixes[rand(@@postfixes.size - 1)]
      passwords[i] = password
      i += 1
    end
    passwords
  end

  private

  # this method reads files that contain syllables
  def read_files
    @@prefixes = IO.read('prefixes.txt').split(' ')
    @@syllables = IO.read('syllables.txt').split(' ')
    @@postfixes = IO.read('postfixes.txt').split(' ')
  end
end

puts 'Enter the number of passwords:'
number_of_passwords = gets.chomp!.to_i

generator = PasswordGenerator.new
puts generator.create_passwords(number_of_passwords)
