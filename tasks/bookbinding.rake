# frozen_string_literal: true

namespace :bookbinding do
  desc 'Bind PDF'
  task :pdf, Bookbinding::Arguments::NAMES do |_, args|
    Bookbinding::Command.new(args).execute
  end
end
