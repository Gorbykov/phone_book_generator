require_relative 'region_selector'

class NameGenerator

  def  initialize(region_selector, files)
    @files = files
    @region_selector = region_selector
  end

  def full_name(gender)
    @gender = gender
    puts last_name
    eval('"' + @region_selector.full_name + '"')
  end

  def first_name
    @files[eval('"'+'first_names'+@region_selector.first_name+'"')].sample
  end

  def middle_name
    @files[eval('"'+'middle_names'+@region_selector.middle_name+'"')].sample
  end

  def last_name
    @files[eval('"'+'last_names'+@region_selector.last_name+'"')].sample
  end

end