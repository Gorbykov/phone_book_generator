require_relative 'phone_book_generator/person'
require_relative 'phone_book_generator/file_loader'

class PhoneBookGenerator

  def self.generate(region, number)
    FileLoader.region = region
    person = Person.new(region)
    number.times do
      puts person.generate.to_s
      puts "-------------------\n"
    end
  end
end