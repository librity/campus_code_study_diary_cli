# frozen_string_literal: true

module CLIStudyItems
  include CLIPrinters
  include CLIFetchers

  def create_study_item
    title = fetch_title
    category = fetch_category
    study_item = new(title: title, category: category)
    print_study_item_created_message(study_item)

    study_item
  end

  def print_study_items(study_items)
    return print_empty_study_items_message if study_items.empty?

    puts study_items
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
