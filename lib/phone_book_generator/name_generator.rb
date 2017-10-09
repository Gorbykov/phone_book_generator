require_relative 'region_selector'

class NameGenerator

  def  initialize(region_selector, first_names_male, first_names_female, last_names)
    @first_names_male = first_names_male
    @first_names_female = first_names_female
    @last_names = last_names
    @region_selector = region_selector
  end

  def full_name(gender)
    @gender = gender
    eval('full_name_'+@region_selector.full_name)
  end

  private
  def full_name_ru
    "#{last_name} #{middle_name} #{first_name}"
  end

  def full_name_us
    "#{first_name} #{last_name}"
  end

  def first_name
    eval('first_name_'+@region_selector.first_name)
  end

  def first_name_male
    first_name_male.sample
  end

  def first_name_female
    first_name_female.sample
  end

  def middle_name
    eval('last_name_'+@region_selector.last_name)
  end

  def middle_name_ru_male
    middle_name = @first_names_male.sample

  end

  def last_name
    eval('last_name_'+@region_selector.last_name)
  end

  def last_name_ru_male
    @last_names.sample
  end
end