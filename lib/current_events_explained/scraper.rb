class CurrentEventsExplained::Scraper

  def self.scrape_explainer
    doc = Nokogiri::HTML(open("https://www.vox.com/explainers"))
    get_articles = doc.search("h2.c-entry-box--compact__title")
    get_articles.map {|a| CurrentEventsExplained::Articles.new(a.children[0].children.text, a.children[0].attribute("href").value)}
  end

  def self.scrape_details(article)
    doc = Nokogiri::HTML(open(article.url))
    article.intro = doc.xpath("//div[@class='c-entry-content']/p").text.slice(0..500) << ' [...to read more, copy link to your browser]'
    article.twitter_handle = doc.xpath("//a[@class='c-byline__twitter-handle']").text
    article.date_time = doc.xpath("//time[@class='c-byline__item']").text.strip
    article.author = doc.children[1].children[1].children[21].attributes.values[1].text
  end
end
