# frozen_string_literal: true

class SpecialStudyItem < StudyItem
  attr_reader :deadline

  def initialize(struct)
    super(struct)
    @deadline = struct.deadline
  end

  def includes_query?(query)
    super || deadline.to_s.include?(query)
  end

  def to_s
    "##{id} - #{title} - #{category} - #{deadline}".cyan
  end

  def successfully_created_message
    "Item '#{title}' da categoria '#{category}' e data de entrega #{deadline} cadastrado com sucesso!".magenta
  end
end
