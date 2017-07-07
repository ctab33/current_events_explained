class CurrentEventsExplained::Articles

  attr_accessor :title, :url, :author, :date, :twitter_handle

  #@@all = []

  def initialize(title = nil, url = nil)
    @title = title
    @url = url
    #@@all << self
    #@@all << make_articles
  end

  def self.all
      @@all ||= scrape_explainer
  end

  def self.find(number)
    self.all[number - 1]
  end

  #Scraping
  def self.scrape_explainer
    doc = Nokogiri::HTML(open("https://www.vox.com/explainers"))
    get_articles = doc.search("h2.c-entry-box--compact__title")
    get_articles.map {|a| new(a.children[0].children.text, a.children[0].attribute("href").value)}
  end

 #url, author, and twitter_handle
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def author
    #author ||= doc.xpath("//a[@class='c-byline__item']").text
    @author ||= doc.xpath("//span[@class='c-byline__item']/a[1]").text
      #best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end

  def date
    @date ||= doc.xpath("//time[@class='c-byline__item']").text
  end

  def twitter_handle
    @twitter_handle ||= doc.xpath("//a[@class='c-byline__twitter-handle']").text
    #<a class="c-byline__twitter-handle" href="http://www.twitter.com/AlexWardVox">@AlexWardVox</a>
  end

end
