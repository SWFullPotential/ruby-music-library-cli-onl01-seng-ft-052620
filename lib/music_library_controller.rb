class MusicLibraryController
  attr_accessor :path 
  
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import 
  end
  
  def call 
      main_menu
  end

  def main_menu
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  
    input = gets.strip

    case input
      when "list songs"
        list_songs
        main_menu
      when "list artists"
        list_artists
        main_menu
      when "list genres"
        list_genres
        main_menu
      when "list artist"
        list_songs_by_artist
        main_menu
      when "list genre"
        list_songs_by_genre
        main_menu
      when "play song"
        play_song
        main_menu
      when "exit"
        exit
      else
        puts "invalid choice"
        main_menu
      end
  end
 
  def list_songs 
      Song.alphabetized.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end
   
  def list_artists
    Artist.alphabetized.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.alphabetized.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)

    if artist
      artist.songs.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
      def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)

    if genre 
      genre.songs.sort{|x, y| x.name <=> y.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip

    if input.to_i.between?(1, Song.all.length)
      song = Song.alphabetized[input.to_i-1]
      if song
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end 
  end
end

  
  
  
  
  
end