class Artist 
  attr_accessor :name, :songs, :genres 
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
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  
  def genres 
    self.songs.map {|song| song.genre}.uniq   
    end
end