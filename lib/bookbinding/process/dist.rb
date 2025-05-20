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
          "#{@arguments.workbench_dir}/**/*.{pdf,epub,html}",
          "#{@arguments.workbench_dir}/**/*-text/*.txt",
          "#{@arguments.workbench_dir}/**/*{-pdf,-idgxml}",
          "#{@arguments.workbench_dir}/**/webroot"
        ].each do |src|
          next if FileTest.directory?(src)

          @filesystem.copy src, src.sub(@arguments.workbench_dir, @arguments.dist_dir)
        end
      end
    end
  end
end
