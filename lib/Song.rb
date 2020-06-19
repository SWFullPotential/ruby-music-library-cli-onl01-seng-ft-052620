class Song 
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable
  extend Concerns::Creatable::ClassMethods
  
  include Concerns::Creatable::InstanceMethods
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre 
  end
    
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end
  
   def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create(name)
    end
  end
  def self.new_from_filename(file)

    artist_name, song_name, genre_name = file.split(" - ")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3", ""))
   
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|song| song.save}
  end
  
end