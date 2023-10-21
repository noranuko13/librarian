# frozen_string_literal: true

require 'fileutils'

module Bookbinding
  class Filesystem
    class FilesystemError < StandardError; end

    def initialize
      @termout = Termout.new
    end

    # @param [String] dir
    def reset_dir(dir)
      @termout.debug 'reset_dir', dir
      begin
        FileUtils.rm_rf dir
        FileUtils.mkdir_p dir
      rescue StandardError => e
        raise FilesystemError, e.backtrace
      end
    end

    # @param [String] src
    # @param [String] dist
    def copy(src, dist)
      @termout.debug 'copy', "#{src} -> #{dist}"
      begin
        FileUtils.mkdir_p File.dirname(dist)
        FileUtils.cp src, dist
      rescue StandardError => e
        raise FilesystemError, e.backtrace
      end
    end

    # @param [String] dir
    def pwd(dir)
      Dir.chdir(dir) do
        @termout.debug 'pwd', Dir.getwd
        yield
      end
      @termout.debug 'pwd', Dir.getwd
    end
  end
end
