# frozen_string_literal: true

class Orchestrator
  include ::CLI

  private_class_method :new

  def self.start
    new.start
  end

  def initialize; end

  def start
    clear
    print_welcome_message
    main_loop
  end

  private

  attr_accessor :study_items

  def main_loop(option = fetch_next_menu_option)
    clear
    return print_exit_message if should_exit?(option)

    handle_option(option)

    await_keypress_and_clear
    main_loop
  end

  def should_exit?(option)
    option == EXIT
  end

  def handle_option(option)
    return StudyItems.register if option == REGISTER_STUDY_ITEM
    return StudyItems.register_special if option == REGISTER_SPECIAL_STUDY_ITEM
    return StudyItems.remove if option == DELETE_STUDY_ITEM
    return StudyItems.print_all if option == VIEW_STUDY_ITEMS
    return StudyItems.search if option == SEARCH_STUDY_ITEMS

    print_invalid_option
  end
end
