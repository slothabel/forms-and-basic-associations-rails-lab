class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre 
  belongs_to :artist 
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    #map instead of each bc it returns a new array
    content = self.notes.map{|note| note.content }
    content
  end

  def note_contents=(content)
    content.each do |content|
      #before passing i had = instead of << but 
      #i remembered in byebug self.notes was an array
      self.notes << Note.find_or_create_by(content: content)
    end
  end
  
  
  
end

