class CurrentEventsExplained::CLI

  def call
    explainer_list
    user_prompt
    #user_done
  end

  def explainer_list
    2.times {puts ""}
    puts "Choose from Vox's list of explainers."
    puts ""
    CurrentEventsExplained::Articles.all.each.with_index(1) do |articles, i|
      puts "  #{i}. #{articles.title}"
    end
    2.times {puts ""}
  end

  def user_prompt
      puts "What explainer would you like to information on? Please enter a number."
      puts "If you'd like to see the list again, type in vox."
      puts "If you're done, type in exit."
      puts ""
      input = gets.strip
      if input == "vox"
        explainer_list
      elsif input.to_i == 0
        puts "Please enter a number that is either 1 or greater."
        explainer_list
      elsif input.to_i > 0
        if articles = CurrentEventsExplained::Articles.find(input.to_i)
          article_details(articles)
          2.times {puts ""}
          puts "Would you like to choose another article? Enter Y or N."
          input = gets.strip.downcase
          if input == "y"
            explainer_list
          else
            puts ""
            puts "Thanks for stopping by!"
            exit
          end
         end
      else
        exit
      end
    end

    def article_details(articles)
      puts ""
      puts "#{articles.title}"
      puts ""
      puts "Written by: #{articles.author}"
      puts ""
      puts "Author's Twitter handle (if provided):  #{articles.twitter_handle}"
      puts ""
      puts "Date and time of publication: #{articles.date_time}"
      puts ""
      puts "Link: #{articles.url}"

      #puts "#{articles.intro}"
    end
end
