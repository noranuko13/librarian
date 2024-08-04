# frozen_string_literal: true

require 'open3'

module Bookbinding
  module Process
    class Review
      class ReviewError < StandardError; end

      # @param [Bookbinding::Arguments] arguments
      def initialize(arguments)
        @termout = Termout.new
        @filesystem = Filesystem.new
        @arguments = arguments
      end

      def run
        @termout.info 'Re:VIEWを実行します'
        review_rake(:pdf)
      end

      private

      # @param [Symbol] type
      def review_rake(type)
        @filesystem.pwd(Constant::WORKBENCH_DIR) do
          # @type [Process::Status] status
          status = Open3.popen2e("rake #{type}") do |stdin, stdout_stderr, wait_thread|
            stdin.close
            stdout_stderr.each { |l| puts l }
            wait_thread.value
          end
          raise ReviewError, 'Re:VIEWの実行に失敗しました' unless status.success?
        end
      end
    end
  end
end
