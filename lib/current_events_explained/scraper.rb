class CurrentEventsExplained::Scraper
 attr_accessor :author, :date_time, :twitter_handle, :intro

  def self.scrape_explainer
    doc = Nokogiri::HTML(open("https://www.vox.com/explainers"))
    get_articles = doc.search("h2.c-entry-box--compact__title")
    get_articles.map {|a| new(a.children[0].children.text, a.children[0].attribute("href").value)}
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def scrape_details
    @intro = doc.xpath("//div[@class='c-entry-content']/p").text.slice(0..500) << ' [...to read more, copy link to your browser]'
    @twitter_handle = doc.xpath("//a[@class='c-byline__twitter-handle']").text
    @date_time = doc.xpath("//time[@class='c-byline__item']").text.strip
    @author = doc.children[1].children[1].children[21].attributes.values[1].text
  end
end
