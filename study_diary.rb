#!/usr/bin/env ruby

# frozen_string_literal: true

require 'sqlite3'

Dir[File.join(__dir__, 'lib', 'cli', '*.rb')].sort.each { |file| require file }
Dir[File.join(__dir__, 'lib', '*.rb')].sort.each { |file| require file }

Orchestrator.start
