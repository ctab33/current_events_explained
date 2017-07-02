class CurrentEventsExplained::CLI

  def call
    explainer_list
    user_prompt
    user_done
  end

  def explainer_list
    puts "Choose from Vox's list of explainers."
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Trump’s new policy to tackle sky-high drug prices makes sense — sort of
    #   2. The outrage over Gal Gadot’s $300,000 paycheck for Wonder Woman, explained
    # DOC
  end

  def user_prompt
    puts "What explainer would you like to read? Please enter a number."
    input = gets.strip
    #Rest of code goes here. Could be case, loop, etc to show when user picks a number, it shows them article.
    #Don't forget to include an exit strategy for user.
    #Account for numbers that aren't listed.
  end

  def user_done
    puts "Thanks for stopping by."
  end




end
