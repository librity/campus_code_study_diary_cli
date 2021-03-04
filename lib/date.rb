# frozen_string_literal: true

class Date
  def self.parse_or_today(string)
    parse(string)
  rescue ArgumentError
    today
  end
end
