# frozen_string_literal: true

module Bookbinding
  class Task
    TYPE_PDF = :pdf
    TYPE_TEXT = :text

    # @param [Rake::Task] task
    def initialize(task)
      @task = task
    end

    # @return [Symbol]
    def type
      @task.name.split(':').last.to_sym
    end
  end
end
