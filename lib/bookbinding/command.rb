# frozen_string_literal: true

module Bookbinding
  class Command
    # @param [Rake::TaskArguments] args
    def initialize(args)
      @arguments = Bookbinding::Arguments.new(args)
    end

    def execute; end
  end
end
