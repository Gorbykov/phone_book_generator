class RegionPrefix
  attr_reader(:country, :house, :phone_code, :apartment)

  def initialize(region_prefix_file)
    @country = region_prefix_file.gets.chomp
    @country[0]=''
    @street = region_prefix_file.gets.chomp.split(' ')
    @house = region_prefix_file.gets.chomp
    @apartment = region_prefix_file.gets.chomp
    @phone = region_prefix_file.gets.chomp
    @phone_code = region_prefix_file.gets.chomp
  end

  def street
    @street.sample
  end
end