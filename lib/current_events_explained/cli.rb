class CurrentEventsExplained::CLI

  def call
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

      if input.to_i > 0
        articles = CurrentEventsExplained::Articles.find(input.to_i)
        article_details(articles)
      elsif input == "vox"
        explainer_list

      else
        puts "Thanks for stopping by!"
      end
    end
  end


    def article_details(articles)
      puts "#{articles.title}"
      puts "Written by: #{articles.author}"
      puts "Author's Twitter handle (if provided):  #{articles.twitter_handle}"
      puts "Date and time of publication: #{articles.date_time}"
      puts ""
      puts "Link: #{articles.url}"
      puts ""
      puts "Introduction: #{articles.intro}"
    end
end
