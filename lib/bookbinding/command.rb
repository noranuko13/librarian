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
    end
  end
end
