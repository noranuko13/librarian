# frozen_string_literal: true

module Bookbinding
  class Task
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
