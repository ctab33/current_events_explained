attr_accessor :title, :url, :author, :date

@@all = []

def initialize(title = nil, url = nil, author = nil, date = nil)
  @title = title
  @url = url
  @author = author
  @date = date
  @@all << self
end

def self.all
#  @@all ||= scrape_explainer
  @@all
end

# def title
#   @title ||= doc.xpath('//div')
# end


  def self.scrape_explainer
    doc = Nokogiri::HTML(open('https://www.vox.com/explainers'))
    articles = doc.search("h2[class='c-entry-box--compact__title'] a[data-analytics-link='article']")
    #binding.pry
    articles.map{|article| new(article.text.strip, "https://www.vox.com#{article.attr("href").strip}")}
    #doc.xpath('//div[@id="block"]/a/@href')
    #article = self.new
    #article.title = doc.search("h2.c-entry-box--compact__title").text.strip

    #article.url = doc.search("a[data-analytics-link='article']").strip

  end






end


#The scaper should tenatively do the following
# 1. Iterate over the articles
# 2. Return a numbered array with title, author, date, and url. Use flatten?
# 3.
