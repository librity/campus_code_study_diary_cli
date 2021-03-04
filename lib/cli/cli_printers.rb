# frozen_string_literal: true

module CLIPrinters
  include CLIOptions

  def clear
    system('clear')
  end

  def print_menu
    puts "[#{REGISTER_STUDY_ITEM}] Cadastrar um item de estudo"
    puts "[#{REGISTER_SPECIAL_STUDY_ITEM}] Cadastrar um item de estudo especial"
    puts "[#{VIEW_STUDY_ITEMS}] Ver todos os itens cadastrados"
    puts "[#{SEARCH_STUDY_ITEMS}] Buscar um item de estudo"
    puts "[#{EXIT}] Sair"
    print 'Escolha uma opção: '
  end

  def print_exit_message
    clear
    puts 'Obrigado por usar o Diário de Estudos'
  end

  def print_welcome_message
    puts 'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
  end

  def print_empty_study_items_message
    puts 'Nenhum item encontrado'
  end

  def print_invalid_option
    puts 'Opção inválida'
  end

  def print_study_item_created_message(study_item)
    puts study_item.successfully_created_message
  end

  def print_study_item(study_item)
    puts study_item.to_s
  end
end
