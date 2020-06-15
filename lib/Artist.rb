class Artist 
  attr_accessor :name, :songs, :genres 
  extend Concerns::Findable
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
    else
      nil
    end
    if @songs.include?(song)
        nil
    else
          @songs << song
        end
        song
  end
  
  def genres 
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.genre)
        nil 
      else
        @new_array << song.genre 
      end
    end
    @new_array
  end
  
  
  
end