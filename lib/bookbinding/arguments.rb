# frozen_string_literal: true

module Bookbinding
  class Arguments
    class ArgumentsError < StandardError; end

    NAMES = %i[shelve jacket].freeze

    # @param [Rake::TaskArguments] args
    def initialize(args)
      @args = args.with_defaults({ shelve: '', jacket: '' })
      raise ArgumentsError, "Required arguments: #{NAMES.join(', ')}" if @args[:shelve].empty? || @args[:jacket].empty?

      @termout = Termout.new
      @termout.debug '@args', @args.to_s
    end

    # @return [String]
    def dist_dir
      File.join(Constant::DIST_DIR, @args[:shelve])
    end

    # @return [String]
    def shelves_dir
      File.join(Constant::SHELVES_DIR, @args[:shelve])
    end

    # @return [String]
    def jackets_dir
      File.join(Constant::JACKETS_DIR, @args[:jacket])
    end
  end
end
