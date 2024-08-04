# frozen_string_literal: true

module Bookbinding
  module Process
    class Setup
      # @param [Bookbinding::Arguments] arguments
      def initialize(arguments)
        @termout = Termout.new
        @filesystem = Filesystem.new
        @arguments = arguments
      end

      def run
        @termout.debug 'Setup'
        @filesystem.reset_dir Constant::DIST_DIR
        @filesystem.reset_dir @arguments.workbench_dir
      end
    end
  end
end
