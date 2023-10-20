# frozen_string_literal: true

require 'rainbow'

module Bookbinding
  class Termout
    COLORS = {
      debug: :magenta,
      info: :blue,
      success: :green,
      warning: :yellow,
      error: :red
    }.freeze

    # @param [String] subject
    # @param [String] body
    def debug(subject, body = '')
      print :debug, subject, body
    end

    # @param [String] subject
    # @param [String] body
    def info(subject, body = '')
      print :info, subject, body
    end

    # @param [String] subject
    # @param [String] body
    def success(subject, body = '')
      print :success, subject, body
    end

    # @param [String] subject
    # @param [String] body
    def warning(subject, body = '')
      print :warning, subject, body
    end

    # @param [String] subject
    # @param [String] body
    def error(subject, body = '')
      print :error, subject, body
    end

    private

    # @param [Symbol] type
    # @param [String] subject
    # @param [String] body
    def print(type, subject, body)
      puts "#{Rainbow("[#{type}] #{subject}").color(COLORS[type])} #{body}".strip
    end
  end
end
