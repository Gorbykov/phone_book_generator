require_relative 'region_prefix'
require_relative 'name_generator'
require_relative 'region_selector'
require 'singleton'

class FileLoader

  include Singleton

  attr_reader :region_prefix, :name_generator

  def initialize
    if @@region.nil?
      raise 'Set region before instantiate'
    end
    @region_selector = RegionSelector.new(@@region)
    open
    @region_prefix = RegionPrefix.new(@files['region_prefix'])
    read

    @name_generator = NameGenerator.new(@region_selector,@files)
  end

  def open
    @files = Hash.new
    Dir.glob("lib/#{@@region}/*.dat") do |file|
      @files[File.basename(file,'.dat')] = File.open(file,'r').set_encoding('UTF-8')
    end
  end

  def read
    @files.keys.each do |key|
      next if key == 'region_prefix'
      @files[key] == @files[key].readlines
    end
  end

  def self.region=(region)
    @@region = region
  end



end