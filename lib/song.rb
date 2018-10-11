class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|p| p.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by!{|s| s.name}
  end

  def self.new_from_filename(data)
   song = data.split("-")
   artist = song[0].chop!
   song_title = song[1].chop!.chop!.chop!.chop!.strip!
   track = self.find_or_create_by_name(song_title)
   track.artist_name = artist
   @@all << track
 end


end
