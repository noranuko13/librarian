# frozen_string_literal: true

namespace :bookbinding do
  desc 'Bind PDF'
  task Bookbinding::Task::TYPE_PDF, Bookbinding::Arguments::NAMES do |task, args|
    Bookbinding::Command.new(task, args).execute
  end

  desc 'Bind TEXT'
  task Bookbinding::Task::TYPE_TEXT, Bookbinding::Arguments::NAMES do |task, args|
    Bookbinding::Command.new(task, args).execute
  end
end
