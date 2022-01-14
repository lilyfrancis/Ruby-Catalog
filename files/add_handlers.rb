require_relative 'item'
require_relative 'game'
require_relative 'author'

module AddHandlers
 def add_game_menu
    game_details = prompt_game_details
    game = create_game(game_details)
    @catalog.add_game(game)
    add_item(game)
    puts "\nSUCCESS: Game added\n"
  end

  def add_item(item)
    add_author(item)
  end

  def add_author(item)
    option = prompt_option(
      "\nEnter existing author number or enter N to add new author",
      @catalog.authors
    )

    if option == 'N'
      author_details = prompt_author_details
      author = create_author(author_details)
      @catalog.add_author(author)
    else
      author = @catalog.authors[option.to_i]
    end

    item.author = author
  end

end