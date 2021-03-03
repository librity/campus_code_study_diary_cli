# frozen_string_literal: true

module CLIStudyItems
  def create_study_item
    title = fetch_title
    category = fetch_category
    study_item = StudyItem.new(title, category)
    print_study_item_created_message(study_item)

    study_item
  end

  def print_study_items(collection)
    return print_empty_collection_message if collection.empty?

    collection.each_with_index do |study_item, index|
      print_study_item(index, study_item)
    end
  end

  def search_study_items(collection)
    return print_empty_collection_message if collection.empty?

    term = fetch_search_word
    found_items = collection.filter do |item|
      item.title.include?(term) || item.category.include?(term)
    end
    print_study_items(found_items)
  end
end
