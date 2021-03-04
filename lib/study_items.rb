# frozen_string_literal: true

class StudyItems
  extend SQL
  extend CLIStudyItems

  def self.all
    run(study_items_query).map do |row|
      next StudyItem.new(cast_study_item(row)) if row[3].nil?

      SpecialStudyItem.new(cast_special_study_item(row))
    end
  end

  def self.register
    title, category = fetch_title_and_category
    run(insert_study_item_query, [title, category])

    cast = cast_study_item([nil, title, category, nil])
    study_item = StudyItem.new(cast)
    print_study_item_created_message(study_item)
  end

  def self.register_special
    title, category = fetch_title_and_category
    deadline = fetch_deadline
    run(insert_special_study_item_query, [title, category, deadline.to_s])

    cast = cast_special_study_item([nil, title, category, deadline])
    study_item = SpecialStudyItem.new(cast)
    print_study_item_created_message(study_item)
  end

  def self.print_all
    print_study_items(all)
  end

  def self.search
    search_study_items(all)
  end

  def self.cast_study_item(row)
    OpenStruct.new(id: row[0], title: row[1], category: row[2], created_at: row[4])
  end

  def self.cast_special_study_item(row)
    OpenStruct.new(cast_study_item(row).to_h.merge(deadline: row[3]))
  end
end
