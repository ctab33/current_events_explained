class CurrentEventsExplained::Articles

  attr_accessor :title, :url, :author, :date_time, :twitter_handle, :intro


 @@all = []
  def initialize(title, url)
    @title = title
    @url = url
    @@all << self
  end

  def self.all
      @@all
  end

  def self.find(number)
    self.all[number - 1]
  end


end
