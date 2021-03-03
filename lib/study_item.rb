# frozen_string_literal: true

# class StudyItem
#   @@next_id = 1
# end
class StudyItem
  extend CLIStudyItems

  @@last_id = 0
  @@study_items = []

  def self.generate_id
    next_id = @@last_id + 1
    @@last_id = next_id

    next_id
  end

  def self.all
    @@study_items
  end

  def self.register
    new_study_item = create_study_item
    all << new_study_item

    new_study_item
  end

  def self.print_all
    print_study_items(all)
  end

  def self.search
    search_study_items(all)
  end
end

class StudyItem
  attr_reader :id, :title, :category

  def initialize(title: 'Misc', category:)
    @id = StudyItem.generate_id
    @title = title
    @category = category
  end

  def includes_query?(query)
    title.include?(query) || category.include?(query)
  end

  def to_s
    "##{id} - #{title} - #{category}"
  end

  def successfully_created_message
    "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  end
end
