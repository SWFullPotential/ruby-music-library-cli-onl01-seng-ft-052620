class Genre 
  attr_accessor :name, :songs 
  extend Concerns::Findable
  extend Concerns::Creatable::ClassMethods
  include Concerns::Creatable::InstanceMethods
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def initialize(name)
    self.name = name
    self.songs = []
  end
 
  def songs 
    @songs
  end
  
  def artists
    self.songs.map {|song| song.artist}.uniq
  end
  
end