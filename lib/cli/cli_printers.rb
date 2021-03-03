# frozen_string_literal: true

module CLIPrinters
  def clear
    system('clear')
  end

  def print_menu
    puts '[1] Cadastrar um item para estudar'
    puts '[2] Ver todos os itens cadastrados'
    puts '[3] Buscar um item de estudo'
    puts '[4] Sair'
    print 'Escolha uma opção: '
  end

  def print_exit_message
    clear
    puts 'Obrigado por usar o Diário de Estudos'
  end

  def print_welcome_message
    puts 'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
  end

  def print_empty_collection_message
    puts 'Nenhum item cadastrado'
  end

  def print_invalid_option
    puts 'Opção inválida'
  end

  def print_study_item_created_message(study_item)
    puts "Item '#{study_item.title}' da categoria '#{study_item.category}' cadastrado com sucesso!"
  end

  def print_study_item(index, study_item)
    puts "##{index + 1} - #{study_item.title} - #{study_item.category}"
  end
end
