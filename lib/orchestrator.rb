# frozen_string_literal: true

class Orchestrator
  include ::CLI

  private_class_method :new

  def self.start
    new.start
  end

  def initialize
    @study_items = []
  end

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
    option == 4
  end

  def handle_option(option)
    return study_items << create_study_item if option == 1
    return print_study_items(study_items) if option == 2
    return search_study_items(study_items) if option == 3

    print_invalid_option
  end
end
