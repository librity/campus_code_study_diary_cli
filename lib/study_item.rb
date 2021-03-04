# frozen_string_literal: true

class StudyItem
  attr_reader :id, :title, :category

  def initialize(struct)
    @id = struct.id
    @title = struct.title
    @category = struct.category
    @created_at = struct.created_at
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
