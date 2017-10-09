require_relative 'region_prefix'
require_relative 'file_loader'


class Person

  def initialize(region)
    @region = region
    @file_loader = FileLoader.instance
    @region_prefix = @file_loader.region_prefix

    #Name
    @name = ''
    @name_generator = @file_loader.name_generator
    #Addres
    @addres = ''
    @adress_generator

    @phone_number = '(29)777-59-98'
    @phone_number_generator

    @zip = '222000'
  end

  def generate
    gender = %w(male female).sample
    @name_generator.full_name(gender)
    self
  end

  def to_s
    <<~FULL_ADDRES
    #{full_name}
    #{@region_prefix.phone_code}#{@phone_number}
    #{address}
    #{@zip}
    #{@region_prefix.country}
    FULL_ADDRES
  end

end