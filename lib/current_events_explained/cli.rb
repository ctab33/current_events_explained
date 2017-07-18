class CurrentEventsExplained::CLI

  def call
    #call scrape_explainer here
    CurrentEventsExplained::Scraper.scrape_explainer
    explainer_list
    user_prompt
  end

  def explainer_list
    2.times {puts ""}
    puts "Choose from Vox's list of 10 most recent explainers."
    puts ""
    CurrentEventsExplained::Articles.all[0..9].each.with_index(1) do |articles, i|
      puts "  #{i}. #{articles.title}"
    end
    2.times {puts ""}
  end


  def user_prompt
    input = nil
    while input != "exit"
      puts ""
      puts "Which explainer would you like more information on? Please enter a corresponding number."
      puts "To see the list of explainers, type vox."
      puts "If you're done browsing, type exit."

      input = gets.strip.downcase

      if input.to_i.between?(1, CurrentEventsExplained::Articles.all.size)
        article = CurrentEventsExplained::Articles.find(input.to_i)
        article.scrape_details
        article_details(article)
      elsif input == "vox"
        explainer_list
      elsif input == "exit"
        puts "Thanks for stopping by!"
      else
        puts "Invalid input. Please try another number."
      end
    end
  end


    def article_details(article)
      puts "#{article.title}"
      puts "Written by: #{article.author}"
      puts "Author's Twitter handle (if provided):  #{article.twitter_handle}"
      puts "Date and time of publication: #{article.date_time}"
      puts ""
      puts "Link: #{article.url}"
      puts ""
      puts "Introduction: #{article.intro}"
    end
end
