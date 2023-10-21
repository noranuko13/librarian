# frozen_string_literal: true

module Bookbinding
  module Process
    class Setup
      def initialize
        @termout = Termout.new
        @filesystem = Filesystem.new
      end

      def run
        @termout.debug 'Setup'
        @filesystem.reset_dir Constant::DIST_DIR
        @filesystem.reset_dir Constant::WORKBENCH_DIR
      end
    end
  end
end
