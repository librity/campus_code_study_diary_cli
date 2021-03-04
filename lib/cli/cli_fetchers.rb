# frozen_string_literal: true

module CLIFetchers
  def await_keypress
    puts
    puts 'Pressione enter para continuar'
    gets
  end

  def await_keypress_and_clear
    await_keypress
    clear
  end

  def fetch_title
    print 'Digite o título do seu item de estudo: '
    gets.chomp
  end

  def fetch_category
    print 'Digite a categoria do seu item de estudo: '
    gets.chomp
  end

  def fetch_date
    print 'Digite a data do seu item de estudo: '
    gets.chomp
  end

  def fetch_query
    print 'Digite uma palavra para procurar: '
    gets.chomp
  end

  def fetch_next_menu_option
    print_menu
    gets.to_i
  end
end
