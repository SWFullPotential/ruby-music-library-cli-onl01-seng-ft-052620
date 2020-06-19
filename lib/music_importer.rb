class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path 
  end
  
  def files
    array = Dir.glob(self.path + "/*.mp3")
    array.map do |file|
      file.gsub(self.path + "/", "")
    end
  end

  def import 
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end