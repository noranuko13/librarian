# frozen_string_literal: true

require 'yaml'

module Bookbinding
  module Process
    class Merge
      # @param [Bookbinding::Arguments] arguments
      def initialize(arguments)
        @termout = Termout.new
        @filesystem = Filesystem.new
        @arguments = arguments
      end

      def run
        @termout.info '設定ファイル(config.yml,style.css)をマージします'
        merge_config
        merge_style
      end

      private

      def merge_config
        @termout.debug 'merge_config'
        jacket = YAML.load_file("#{@arguments.jackets_dir}/config.yml")
        @termout.debug 'jacket', jacket
        shelve = YAML.load_file("#{@arguments.shelves_dir}/config.yml")
        @termout.debug 'shelve', shelve
        merged = jacket.merge(shelve)
        @termout.info 'merged', merged
        path = File.join(@arguments.workbench_dir, 'config.yml')
        File.write(path, YAML.dump(merged).gsub(/^---$/, ''))
      end

      def merge_style
        @termout.debug 'merge_style'

        File.open(File.join(@arguments.workbench_dir, 'style.css'), 'w') do |f|
          jacket_path = File.join(@arguments.jackets_dir, 'style.css')
          f.puts(File.read(jacket_path)) if File.exist? jacket_path
          shelve_path = File.join(@arguments.shelves_dir, 'style.css')
          f.puts(File.read(shelve_path)) if File.exist? shelve_path
        end
      end
    end
  end
end
