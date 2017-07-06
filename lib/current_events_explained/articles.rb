class CurrentEventsExplained::Articles

  attr_accessor :title, :url, :author, :date, :twitter_handle

  @@all = []

  def initialize(title = nil, url = nil)
    @title = title
    @url = url
    #@@all << self
    @@all << make_articles
  end

  def self.all
    @@all
  end

  def self.find(number)
    self.all[number - 1]
  end

  #Scraping
  def get_page
      doc = Nokogiri::HTML(open("https://www.vox.com/explainers"))
  end

  def get_articles
      self.get_page.css(".c-entry-box--compact__title")
  end

  def self.scrape_explainer
    self.get_articles.each do |article|
      articles = Articles.new
      articles.title = article.children[0].children.text
      article.url = article.children[0].attribute("href").value
    end
  end



  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def author
    @author ||= doc.search()
  end

  def date
    @date ||= doc.search()
  end

  def twitter_handle
    @twitter_handle ||= doc.search()
  end

end
