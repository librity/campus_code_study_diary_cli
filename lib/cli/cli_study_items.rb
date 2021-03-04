# frozen_string_literal: true

module CLIStudyItems
  include CLIPrinters
  include CLIFetchers

  def print_study_items(study_items)
    return print_empty_study_items_message if study_items.empty?

    print_study_item_table_head
    study_items.each { |item| print_study_item(item) }
    print_table_separator
  end

  def search_study_items(study_items)
    return print_empty_study_items_message if study_items.empty?

    query = fetch_query
    matching_items = study_items.filter do |item|
      item.includes_query?(query)
    end

    print_study_items(matching_items)
  end
end
