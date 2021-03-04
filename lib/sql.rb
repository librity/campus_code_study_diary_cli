# frozen_string_literal: true

# Queries
module SQL
  DATABASE = SQLite3::Database.open 'db/study_diary.db'

  def run(query, params = nil)
    return DATABASE.execute(query, params) if params

    DATABASE.execute(query)
  end

  def study_items_query
    read_file('study_items.sql')
  end

  def insert_study_item_query
    read_file('insert_study_item.sql')
  end

  def insert_special_study_item_query
    read_file('insert_special_study_item.sql')
  end

  private

  def read_file(file)
    file_path = File.join(Dir.pwd, 'db', 'queries', file)

    File.open(file_path).read
  end
end
