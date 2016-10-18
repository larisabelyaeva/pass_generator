# генератор произносимых паролей
# выводит заданное пользователем количество паролей заданной длины

$vowels = ["a", "e", "u", "o", "i", "y"]
$consonants = ["q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m"]

# вспомогательные методы
def is_vowel?(letter)
  $vowels.include?(letter)
end

def is_consonant?(letter)
  $consonants.include?(letter)
end

puts "Enter the number of passwords:"
$number_of_passwords = gets.chomp!.to_i
puts "Enter the password length (from 8 to 20):"
$password_length = gets.chomp!.to_i
while ($password_length < 8 || $password_length > 20)
  puts "Please, enter number from 8 to 20"
  $password_length = gets.chomp!.to_i
end

#метод, генерирующий пароли
def create_passwords
  passwords = Array.new($number_of_passwords)
  i = 0
  passwords.each { |password|
    password = ($vowels + $consonants)[rand($vowels.length + $consonants.length - 1)]
    pass_arr = password.split("")
    $password_length.times do
      if (is_vowel?(pass_arr[-1]))
        pass_arr.push($consonants[rand($consonants.length - 1)])
      else
        pass_arr.push($vowels[rand($vowels.length - 1)])
      end
    end
    password = pass_arr.join("")
    passwords[i] = password
    i += 1
  }
  puts "Your passwords:"
  passwords.each { |password| puts password  }
end

create_passwords
