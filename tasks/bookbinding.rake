# frozen_string_literal: true

namespace :bookbinding do
  desc 'Bind PDF'
  task :pdf, Bookbinding::Arguments::NAMES do |task, args|
    Bookbinding::Command.new(task, args).execute
  end

  desc 'Bind TEXT'
  task :text, Bookbinding::Arguments::NAMES do |task, args|
    Bookbinding::Command.new(task, args).execute
  end
end
