# frozen_string_literal: true

class StudyItems
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

  def self.register_special
    new_special_study_item = create_new_special_study_item
    all << new_special_study_item

    new_special_study_item
  end

  def self.print_all
    print_study_items(all)
  end

  def self.search
    search_study_items(all)
  end
end
