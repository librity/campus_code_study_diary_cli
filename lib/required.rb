# frozen_string_literal: true

require 'sqlite3'
require 'colorize'
require 'ostruct'

Dir[File.join(Dir.pwd, 'lib', 'cli', '*.rb')].sort.each { |file| require file }
Dir[File.join(Dir.pwd, 'lib', '*.rb')].sort.each { |file| require file }
Dir[File.join(Dir.pwd, 'lib', 'study_item', '*.rb')].sort.each { |file| require file }
