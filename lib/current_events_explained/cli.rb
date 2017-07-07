class CurrentEventsExplained::CLI

  def call
    explainer_list
    #user_prompt
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

  # def user_prompt
  #   while input != "exit"
  #     puts "What explainer would you like to read? Please enter a number."
  #     puts "If you're done, type in exit."
  #     puts ""
  #     input = gets.strip
  #     if input == "explainers"
  #       explainer_list
  #     else
  #       user_done
  #     end
  #   end
  # end

  # def user_done
  #   puts "Thanks for stopping by."
  # end
end
