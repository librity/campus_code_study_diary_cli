# frozen_string_literal: true

class SpecialStudyItem < StudyItem
  attr_reader :date

  def initialize(title:, category:, date:)
    super(title: title, category: category)
    @date = Date.parse_or_today(date)
  end

  def includes_query?(query)
    super || date.to_s.include?(query)
  end

  def to_s
    "##{id} - #{title} - #{category} - #{date}"
  end

  def successfully_created_message
    "Item '#{title}' da categoria '#{category}' e data #{date} cadastrado com sucesso!"
  end
end
