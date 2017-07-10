class CurrentEventsExplained::Articles

  attr_reader :title, :url, :author, :date_time, :twitter_handle, :intro


  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.all
      @@all ||= scrape_explainer
  end


  def self.find(number)
    self.all[number - 1]
  end


  def self.scrape_explainer
    doc = Nokogiri::HTML(open("https://www.vox.com/explainers"))
    get_articles = doc.search("h2.c-entry-box--compact__title")
    store_articles = get_articles.map {|a| new(a.children[0].children.text, a.children[0].attribute("href").value)}
    store_articles.delete_at(7)
    store_articles
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def author
    @author ||= doc.children[1].children[1].children[21].attributes.values[1].text
  end

  def date_time
    @date_time ||= doc.xpath("//time[@class='c-byline__item']").text.strip
  end

  def twitter_handle
    @twitter_handle ||= doc.xpath("//a[@class='c-byline__twitter-handle']").text
  end

  def intro
    @intro ||= doc.xpath("//div[@class='c-entry-content']/p").text.slice(0..500) << ' [...to read more, copy link to your browser]'
  end

end
