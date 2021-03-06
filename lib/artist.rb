class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def save
    if @@all.include?(self) == false
      @@all << self
    end
  end

  def add_song(tune)
    if self.songs.include?(tune) == false
      self.songs << tune
    end
    if tune.artist != self
      tune.artist = self
    end
  end

  def genres
    genres = []
    @songs.each do |a|
      if genres.include?(a.genre) == false
        genres << a.genre
      end
    end
    genres
  end

end




















