# frozen_string_literal: true

module Bookbinding
  class Command
    # @param [Rake::TaskArguments] args
    def initialize(task, args)
      @termout = Termout.new
      @task = task
      @arguments = Bookbinding::Arguments.new(args)
    end

    def execute
      @termout.info '製本を開始します'
      Process::Setup.new(@arguments).run
      Process::Collect.new(@arguments).run
      Process::Merge.new(@arguments).run
      Process::Review.new(@arguments).run
      Process::Dist.new(@arguments).run
      @termout.success '製本を終了します'
    end
  end
end
