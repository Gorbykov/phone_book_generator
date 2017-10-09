class FileCreator

  def self.create(name,s);
    s = s.split(', ')
    f = File.open(name+'.dat','w')
    s.each do |line|
      f.puts(line)
    end
    f.close
  end
end