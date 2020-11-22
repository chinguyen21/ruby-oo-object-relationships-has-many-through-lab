

class Artist
  attr_reader :name 

  @@all =[]
  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.artist ==self}
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

  def genres
    genres = []
    Song.all.each do |song| 
      genres << song.genre if song.artist == self
    end
    genres
  end

end

