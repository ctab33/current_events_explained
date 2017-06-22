require 'nokogiri'
require 'open-uri'
require 'pry'
class CurrentEventsExplained::Scraper
  attr_accessor :title, :author, :date, :url

    def self.scrape_explainer
      doc = Nokogiri::HTML(open('https://www.vox.com/explainers'))
      binding.pry
      articles = doc.search()

    end
end


#The scaper should tenatively do the following
# 1. Iterate over the articles
# 2. Return a numbered array with title, author, date, and url. Use flatten?
# 3.
