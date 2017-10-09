class RegionSelector

  @err = 'Unknown region'

  def initialize(region)
    @region = region
  end

  def address
    case @region
      when 'ru_RU', 'be_BY'
        return 'ru'
      when 'en_US'
        return 'us'
      else
        raise @err
    end
  end

  def full_name
    case @region
      when 'ru_RU', 'be_BY'
        return 'ru'
      when 'en_US'
        return 'us'
      else
        raise @err
    end
  end

  def first_name
    case @region
      when 'ru_RU','be_BY','en_US'
        return '#{gender}'
      else
        raise @err
    end
  end

  def middle_name
    last_name  
  end
  
  def last_name
    case @region
      when 'ru_RU'
        return 'ru_#{gender}'
      when 'be_BY'
        return 'be_#{gender}'
      when 'en_US'
        return 'us'
      else
        raise @err
    end
  end
end