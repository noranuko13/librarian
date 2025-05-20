# frozen_string_literal: true

RSpec.shared_context 'shared task' do
  let(:task_type) { Bookbinding::Task::TYPE_PDF }

  let(:rake_task) { Rake.application["bookbinding:#{task_type}"] }

  let(:task) { Bookbinding::Task.new rake_task }
end
