# frozen_string_literal: true

module Bookbinding
  module Process
    class Collect
      # @param [Bookbinding::Arguments] arguments
      def initialize(arguments)
        @termout = Termout.new
        @filesystem = Filesystem.new
        @arguments = arguments
      end

      def run
        @termout.info '本の素材を掻き集めます'
        copy_from_upgrade
        copy_from_jackets
        copy_from_shelves
      end

      private

      def copy_from_upgrade
        @termout.debug 'copy_upgrade'
        Dir["#{Constant::UPGRADE_DIR}/lib/**/*", "#{Constant::UPGRADE_DIR}/sty/**/*.{sty,cls}",
            "#{Constant::UPGRADE_DIR}/Rakefile"].each do |src|
          next if FileTest.directory?(src)

          @filesystem.copy src, src.sub(Constant::UPGRADE_DIR, Constant::WORKBENCH_DIR)
        end
      end

      def copy_from_jackets
        @termout.debug 'copy_from_jackets'
        Dir["#{@arguments.jackets_dir}/sty/**/*"].each do |src|
          next if FileTest.directory?(src)

          @filesystem.copy src, src.sub(@arguments.jackets_dir, Constant::WORKBENCH_DIR)
        end
      end

      def copy_from_shelves
        @termout.debug 'copy_from_shelves'
        Dir["#{@arguments.shelves_dir}/images/**/*", "#{@arguments.shelves_dir}/plantumls/**/*",
            "#{@arguments.shelves_dir}/**/*.re", "#{@arguments.shelves_dir}/catalog.yml"].each do |src|
          next if FileTest.directory?(src)

          @filesystem.copy src, src.sub(@arguments.shelves_dir, Constant::WORKBENCH_DIR)
        end
      end
    end
  end
end
