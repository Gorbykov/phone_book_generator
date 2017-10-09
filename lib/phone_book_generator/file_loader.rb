require_relative 'region_prefix'
require_relative 'name_generator'
require_relative 'region_selector'
require 'singleton'

class FileLoader

  include Singleton

  attr_reader :region_prefix, :name_generator

  @@region = ''

  def initialize
    if @@region == ''
      raise 'Set region before instantiate'
    end

    region_prefix_file = File.open("lib/#{@@region}/RegionPrefix.dat", 'r').set_encoding('UTF-8')
    @region_prefix = RegionPrefix.new(region_prefix_file)
    first_names_male_file = File.open("lib/#{@@region}/FirstNamesMale.dat", 'r').set_encoding('UTF-8')
    first_names_female_file = File.open("lib/#{@@region}/FirstNamesFemale.dat", 'r').set_encoding('UTF-8')
    last_names_file = File.open("lib/#{@@region}/LastNames.dat", 'r').set_encoding('UTF-8')
    @name_generator = NameGenerator.new(@region_selector,
                                        first_names_male_file.readlines,
                                        first_names_female_file.readlines,
                                        last_names_file.readlines)
  end

  def self.region=(region)
    @@region = region
    @region_selector = RegionSelector.new(region)
  end



end