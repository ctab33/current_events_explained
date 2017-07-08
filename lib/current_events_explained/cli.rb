class CurrentEventsExplained::CLI

  def call
    #explainer_list
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
    user_instructions
  end

  def user_instructions
    puts ""
    puts "Which explainer would you like more information on? Please enter a corresponding number."
    puts "If you'd like to see the list again, type in vox."
    puts "If you're done, type in exit."
    puts ""
  end

  def user_prompt
      input = nil
      while input != "exit"
        input = gets.strip
        if input == "vox"
          explainer_list
          user_instructions
        elsif input.to_i == 0
          explainer_list
          puts "Please enter a number that is either 1 or greater."
        else input.to_i > 0
          if articles = CurrentEventsExplained::Articles.find(input.to_i)
            article_details(articles)
            2.times {puts ""}
            puts "Would you like to choose another article? Enter Y or N."
            input = gets.strip.downcase
              if input == "y"
                explainer_list
              else
                puts "Thanks for stopping by!"
            #exit
          end #ends line 41
        end #end line 36
      end #end line 30
    end #end until
    end

    def article_details(articles)
      puts "#{articles.title}"
      puts "Written by: #{articles.author}"
      puts "Author's Twitter handle (if provided):  #{articles.twitter_handle}"
      puts "Date and time of publication: #{articles.date_time}"
      puts "Link: #{articles.url}"
      puts "Introduction: #{articles.intro}"
    end
end
