# frozen_string_literal: true

module CLIFetchers
  def await_keypress
    puts
    puts 'Pressione enter para continuar'.green
    gets
  end

  def await_keypress_and_clear
    await_keypress
    clear
  end

  def fetch_title
    print 'Digite o título do seu item de estudo: '.green
    gets.chomp
  end

  def fetch_category
    print 'Digite a categoria do seu item de estudo: '.green
    gets.chomp
  end

  def fetch_title_and_category
    [fetch_title, fetch_category]
  end

  def fetch_deadline
    print 'Digite a data limite do seu item de estudo: '.green
    Date.parse_or_today(gets.chomp)
  end

  def fetch_query
    print 'Digite uma palavra para procurar: '.green
    gets.chomp
  end

  def fetch_deleted_id
    print 'Digite o ID do item que deseja deletar: '.green
    gets.to_i
  end

  def fetch_next_menu_option
    print_menu
    gets.to_i
  end
end
