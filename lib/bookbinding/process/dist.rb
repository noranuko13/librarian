# frozen_string_literal: true

module Bookbinding
  module Process
    class Dist
      # @param [Bookbinding::Arguments] arguments
      def initialize(arguments)
        @termout = Termout.new
        @filesystem = Filesystem.new
        @arguments = arguments
      end

      def run
        @termout.info '生成物をdistに配置します'
        Dir[
          "#{Constant::WORKBENCH_DIR}/**/*.{pdf,epub,html}",
          "#{Constant::WORKBENCH_DIR}/**/*{-pdf,-text,-idgxml}",
          "#{Constant::WORKBENCH_DIR}/**/webroot",
        ].each do |src|
          next if FileTest.directory?(src)

          @filesystem.copy src, src.sub(Constant::WORKBENCH_DIR, @arguments.dist_dir)
        end
      end
    end
  end
end
