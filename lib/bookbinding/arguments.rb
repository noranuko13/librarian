# frozen_string_literal: true

module Bookbinding
  class Arguments
    class ArgumentsError < StandardError; end

    NAMES = %i[shelve jacket type].freeze
    REQUIRED_ARGS = %i[shelve jacket].freeze
    ALLOWED_TYPES = %i[pdf text].freeze

    # @param [Rake::TaskArguments] args
    def initialize(args)
      @args = args.with_defaults({ shelve: '', jacket: '', type: 'pdf' })
      if REQUIRED_ARGS.any? { |key| @args[key].empty? }
        raise ArgumentsError, "Required arguments: #{REQUIRED_ARGS.join(', ')}"
      end
      unless ALLOWED_TYPES.include?(@args.fetch(:type, '').to_sym)
        raise ArgumentsError, "Allowed type: #{ALLOWED_TYPES.join(', ')}"
      end

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

    # @return [String]
    def workbench_dir
      File.join(Constant::WORKBENCH_DIR, @args[:shelve])
    end

    # @return [Symbol]
    def type
      @args[:type].to_sym
    end
  end
end
