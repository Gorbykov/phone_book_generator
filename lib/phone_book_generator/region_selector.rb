class RegionSelector

  def initialize(region)
    @region = region
    @err = RuntimeError.new('Unknown region')
  end

  def address
    case @region
      when 'ru-RU', 'be-BY'
        return 'ru'
      when 'en-US'
        return 'us'
      else
        raise @err
    end
  end

  def full_name
    case @region
      when 'ru-RU', 'be-BY'
        return '#{last_name} #{middle_name} #{first_name}'
      when 'en-US'
        return '#{first_name} #{last_name}'
      else
        raise @err
    end

    def last_name
      case @region
        when 'ru-RU', 'be-BY'
          return '_#{gender}'
        when 'en-US'
          return ''
        else
          raise @err
      end
    end

    def middle_name
      last_name
    end

    def first_name
      last_name
    end
  end
end