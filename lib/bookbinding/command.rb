# frozen_string_literal: true

module Bookbinding
  class Command
    # @param [Rake::TaskArguments] args
    def initialize(args)
      @termout = Termout.new
      @arguments = Bookbinding::Arguments.new(args)
    end

    def execute
      @termout.info '製本を開始します'
      Process::Setup.new.run
      Process::Collect.new(@arguments).run
      Process::Merge.new(@arguments).run
      Process::Review.new.run
    end
  end
end
