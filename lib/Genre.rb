class Genre 
  attr_accessor :name, :songs 
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
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def songs 
    @songs
  end
  
    def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end
  
end