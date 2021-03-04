# frozen_string_literal: true

module CLIPrinters
  include CLIOptions

  TABLE_FORMAT = "|%-5s |%-30s |%-30s |%-15s |%-19s|\n"

  def clear
    system('clear')
  end

  def print_menu
    puts "[#{REGISTER_STUDY_ITEM}] Cadastrar um item de estudo".yellow
    puts "[#{REGISTER_SPECIAL_STUDY_ITEM}] Cadastrar um item de estudo com data limite".yellow
    puts "[#{DELETE_STUDY_ITEM}] Deletar item de estudo".yellow
    puts "[#{VIEW_STUDY_ITEMS}] Ver todos os itens cadastrados".yellow
    puts "[#{SEARCH_STUDY_ITEMS}] Buscar um item de estudo".yellow
    puts "[#{EXIT}] Sair".red
    print 'Escolha uma opção: '.green
  end

  def print_exit_message
    clear
    puts 'Obrigado por usar o Diário de Estudos'.blue
  end

  def print_welcome_message
    puts 'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'.blue
  end

  def print_empty_study_items_message
    puts 'Nenhum item encontrado'.blue
  end

  def print_invalid_option
    puts 'Opção inválida'.blue
  end

  def print_study_item_deleted_successfully(id)
    puts "Item de estudo ##{id} deletado!".magenta
  end

  def print_table_separator
    puts ('-' * 109).green
  end

  def print_study_item_table_head
    print_table_separator
    printf TABLE_FORMAT.magenta, 'ID', 'CATEGORIA', 'NOME', 'DATA LIMITE', 'CRIADO EM'
    print_table_separator
  end

  def print_study_item_created_message(study_item)
    puts study_item.successfully_created_message
  end

  def print_study_item(study_item)
    if study_item.class == StudyItem
      printf(TABLE_FORMAT.cyan, study_item.id, study_item.category,
             study_item.title, 'n/a', study_item.created_at)
      return
    end

    printf(TABLE_FORMAT.cyan, study_item.id, study_item.category,
           study_item.title, study_item.deadline, study_item.created_at)
  end
end
