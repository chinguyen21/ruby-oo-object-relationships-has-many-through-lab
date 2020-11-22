
class Genre
  attr_reader :name
  
  @@all = []
  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.genre == self}
  end

  def artists
    artists = []
    Song.all.each do |song| 
      artists << song.artist if song.genre == self
    end
    artists
  end
end