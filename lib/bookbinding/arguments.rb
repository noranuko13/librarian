# frozen_string_literal: true

module Bookbinding
  class Arguments
    class ArgumentsError < StandardError; end

    NAMES = %i[shelve jacket].freeze

    # @param [Rake::TaskArguments] args
    def initialize(args)
      @args = verify(args).to_h

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

    private

    # @param [Rake::TaskArguments] args
    # @return [Dry::Validation::Result]
    def verify(args)
      result = Verify::ArgumentsContract.new.call(args.to_h)
      raise ArgumentsError, result.errors.to_h if result.failure?

      result
    end
  end
end
